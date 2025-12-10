import { MongoClient } from 'mongodb';

export async function transferMoney(fromAccount, toAccount, amount, remark) {
  const client = new MongoClient('mongodb://localhost:27017/?replicaSet=rs0&directConnection=true');
  
  try {
    await client.connect();
    const collection = client.db('bank_db').collection('accounts');
    
    // Начинаем транзакцию --- start a transaction
    const session = client.startSession();
    
    try {
      const result = await session.withTransaction(async () => {
        // 1. Проверяем существование счетов --- check account existence
        const fromAcc = await collection.findOne(
          { account_number: fromAccount },
          { session }
        );
        const toAcc = await collection.findOne(
          { account_number: toAccount },
          { session }
        );
        
        if (!fromAcc || !toAcc) {
          throw new Error('Account not found');
        }
        
        // 2. Проверяем достаточно ли денег на счете отправителя --- check sufficient funds
        if (fromAcc.balance < amount) {
          throw new Error('Insufficient funds');
        }
        
        // 3. Обновляем балансы и добавляем записи об изменениях --- update balances and add change records
        const lastChangeFrom = fromAcc.account_changes.length;
        const lastChangeTo = toAcc.account_changes.length;
        
        await collection.updateOne(
          { account_number: fromAccount },
          {
            $inc: { balance: -amount },
            $push: {
              account_changes: {
                change_number: lastChangeFrom + 1,
                amount: -amount,
                changed_date: new Date(),
                remark: remark
              }
            }
          },
          { session }
        );
        
        await collection.updateOne(
          { account_number: toAccount },
          {
            $inc: { balance: amount },
            $push: {
              account_changes: {
                change_number: lastChangeTo + 1,
                amount: amount,
                changed_date: new Date(),
                remark: remark
              }
            }
          },
          { session }
        );
        
        console.log(`Transfer successful: ${amount} from ${fromAccount} to ${toAccount}`);
      });
      
    } finally {
      await session.endSession();
    }
    
  } finally {
    await client.close();
  }
}
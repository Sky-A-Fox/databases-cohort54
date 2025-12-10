import { setupDatabase } from './setup.js';
import { transferMoney } from './transfer.js';

async function main() {
  // 1. Настраиваем базу данных --- setup the database
  await setupDatabase();
  
  // 2. Выполняем перевод --- perform a transfer
  await transferMoney(101, 102, 1000, "Test transfer");
  
  // 3. Проверяем результат --- check the result
  const { MongoClient } = await import('mongodb');
  const client = new MongoClient('mongodb://localhost:27017/?replicaSet=rs0&directConnection=true');
  
  await client.connect();
  const collection = client.db('bank_db').collection('accounts');
  
  const account101 = await collection.findOne({ account_number: 101 });
  const account102 = await collection.findOne({ account_number: 102 });
  
  console.log('\nAccount 101 balance:', account101.balance);
  console.log('Account 102 balance:', account102.balance);
  
  await client.close();
}

main().catch(console.error);
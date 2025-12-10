import { MongoClient } from 'mongodb';

export async function setupDatabase() {
  const client = new MongoClient('mongodb://localhost:27017/?replicaSet=rs0&directConnection=true');
  
  try {
    await client.connect();
    const collection = client.db('bank_db').collection('accounts');
    
    // Очищаем коллекцию
    await collection.deleteMany({});
    
    // Создаем тестовые счета
    const accounts = [
      {
        account_number: 101,
        balance: 10000,
        account_changes: [
          {
            change_number: 1,
            amount: 10000,
            changed_date: new Date(),
            remark: "Initial deposit"
          }
        ]
      },
      {
        account_number: 102,
        balance: 5000,
        account_changes: [
          {
            change_number: 1,
            amount: 5000,
            changed_date: new Date(),
            remark: "Initial deposit"
          }
        ]
      },
      {
        account_number: 103,
        balance: 2000,
        account_changes: [
          {
            change_number: 1,
            amount: 2000,
            changed_date: new Date(),
            remark: "Initial deposit"
          }
        ]
      }
    ];
    
    await collection.insertMany(accounts);
    console.log('Database setup completed');
    
  } finally {
    await client.close();
  }
}

// Для тестирования
// setupDatabase();
const { Client } = require('pg');

// Вставляем тестовые данные в таблицы --- insert test data into tables (оставил пароль без учета безопасности --- left password without security considerations)
const insertValues = async () => {
    const client = new Client({
        host: 'localhost',
        port: 5432,
        database: 'hyfuser',
        user: 'hyfuser',
        password: 'hyfpassword'
    });

    try {
        await client.connect();
        
        // Вставляем тестовые счета --- insert test accounts
        await client.query(`
            INSERT INTO account (account_number, balance) 
            VALUES 
                (101, 5000.00),
                (102, 3000.00),
                (103, 10000.00)
            ON CONFLICT (account_number) DO NOTHING
        `);
        
        console.log('Test data inserted successfully!');
        
        // Показываем что получилось --- show the result
        const result = await client.query('SELECT * FROM account');
        console.log('Current accounts:', result.rows);
        
    } catch (error) {
        console.error('Error inserting data:', error);
    } finally {
        await client.end();
    }
};

insertValues();
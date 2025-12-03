const { Client } = require('pg');

const createTables = async () => {
    const client = new Client({
        host: 'localhost',
        port: 5432,
        database: 'hyfuser',
        user: 'hyfuser',
        password: 'hyfpassword'
    });

    try {
        await client.connect();
        
        // Создаем таблицу account --- create table account
        await client.query(`
            CREATE TABLE IF NOT EXISTS account (
                account_number INT PRIMARY KEY,
                balance DECIMAL(10,2) NOT NULL DEFAULT 0.00,
                CONSTRAINT balance_non_negative CHECK (balance >= 0)
            )
        `);
        
        // Создаем таблицу account_changes --- create table account_changes
        await client.query(`
            CREATE TABLE IF NOT EXISTS account_changes (
                change_number SERIAL PRIMARY KEY,
                account_number INT NOT NULL,
                amount DECIMAL(10,2) NOT NULL,
                changed_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                remark VARCHAR(255),
                FOREIGN KEY (account_number) REFERENCES account(account_number)
            )
        `);
        
        console.log('Tables created successfully!');
        
    } catch (error) {
        console.error('Error creating tables:', error);
    } finally {
        await client.end();
    }
};

createTables();
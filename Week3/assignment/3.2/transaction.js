const { Client } = require('pg');

const transferMoney = async () => {
    const client = new Client({
        host: 'localhost',
        port: 5432,
        database: 'hyfuser',
        user: 'hyfuser',
        password: 'hyfpassword'
    });

    try {
        await client.connect();
        
        // Начинаем транзакцию --- begin transaction
        await client.query('BEGIN');
        
        const fromAccount = 101;
        const toAccount = 102;
        const amount = 1000.00;
        
        // 1. Проверяем достаточно ли средств на счете 101 --- check if there are enough funds in account 101
        const checkBalance = await client.query(
            'SELECT balance FROM account WHERE account_number = $1',
            [fromAccount]
        );
        
        if (checkBalance.rows.length === 0) {
            throw new Error(`account ${fromAccount} not found`);
        }
        
        if (checkBalance.rows[0].balance < amount) {
            throw new Error(`Insufficient funds in account ${fromAccount}`);
        }
        
        // 2. Снимаем деньги со счета 101 --- withdraw money from account 101
        await client.query(
            'UPDATE account SET balance = balance - $1 WHERE account_number = $2',
            [amount, fromAccount]
        );
        
        // 3. Записываем операцию снятия в account_changes --- record withdrawal in account_changes
        await client.query(
            `INSERT INTO account_changes (account_number, amount, remark) 
             VALUES ($1, $2, $3)`,
            [fromAccount, -amount, `Transfer to account ${toAccount}`]
        );
        
        // 4. Добавляем деньги на счет 102 --- add money to account 102
        await client.query(
            'UPDATE account SET balance = balance + $1 WHERE account_number = $2',
            [amount, toAccount]
        );
        
        // 5. Записываем операцию пополнения в account_changes --- record deposit in account_changes
        await client.query(
            `INSERT INTO account_changes (account_number, amount, remark) 
             VALUES ($1, $2, $3)`,
            [toAccount, amount, `Transfer from account ${fromAccount}`]
        );
        
        // Фиксируем транзакцию --- commit transaction
        await client.query('COMMIT');
        
        console.log(`✅ Transfer of ${amount} from account ${fromAccount} to account ${toAccount} completed successfully!`);
        
        // Показываем результат --- show the result
        const result = await client.query(
            'SELECT * FROM account WHERE account_number IN ($1, $2)',
            [fromAccount, toAccount]
        );
        console.log('New balances:', result.rows);
        
    } catch (error) {
        // Откатываем транзакцию при ошибке --- rollback transaction on error
        await client.query('ROLLBACK');
        console.error('❌ Transaction error:', error.message);
    } finally {
        await client.end();
    }
};

transferMoney();
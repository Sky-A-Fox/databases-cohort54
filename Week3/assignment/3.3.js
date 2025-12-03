/*this code below will delete table? my pesonal opinion tis one is far mpre dangerous
const name = "'; DROP TABLE Country; --";
const code = "anything";*/

/*this code below will return all records
const name = "' OR '1'='1";
const code = "' OR '1'='1";*/

function getPopulation(Country, name, code, cb) {
    //  Валидация имени таблицы --- validate table name
    const allowedTables = ['Country']; // Допустимые имена таблиц --- allowed table names
    if (!allowedTables.includes(Country)) {
        return cb(new Error('Invalid table name'));
    }
    
    //  Параметризованный запрос --- parameterized query to prevent SQL injection
    conn.query(
        'SELECT Population FROM Country WHERE Name = $1 AND Code = $2',
        [name, code],
        function(err, result) {
            if (err) return cb(err);
            if (result.length == 0) return cb(new Error('Not found'));
            
            // 3. Возвращаем Population (according file ..databases/Week1/databases/world.sql)
            cb(null, result[0].Population);
        }
    );
}
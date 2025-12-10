const { MongoClient } = require('mongodb');
const fs = require('fs');
const csv = require('csv-parser');

async function importData() {
  const client = new MongoClient('mongodb://localhost:27018');
  
  try {
    await client.connect();
    const db = client.db('population_db');
    const collection = db.collection('population');
    
    const documents = [];
    fs.createReadStream('../../ex1-aggregation/population_pyramid_1950-2022.csv')
      .pipe(csv())
      .on('data', (row) => {
        documents.push({
          Country: row.Country,
          Year: parseInt(row.Year),
          Age: row.Age,
          M: parseInt(row.M),
          F: parseInt(row.F)
        });
      })
      .on('end', async () => {
        await collection.insertMany(documents);
        console.log(`Imported ${documents.length} documents`);
        await client.close();
      });
  } catch (error) {
    console.error(error);
  }
}

importData();
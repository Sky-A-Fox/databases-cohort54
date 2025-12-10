const { MongoClient } = require('mongodb');

// Функция 1: Население по годам для страны   --- exercise asks for country
async function getPopulationByYear(country) {
  const client = new MongoClient('mongodb://localhost:27018');
  
  try {
    await client.connect();
    const collection = client.db('population_db').collection('population');
    
    const result = await collection.aggregate([
      { $match: { 
        Country: country,
        Year: { $in: [1950, 1960, 1970, 1980, 1990, 2000, 2010, 2020, 2022] }
      }},
      { $group: {
        _id: "$Year",
        countPopulation: { $sum: { $add: ["$M", "$F"] } }
      }},
      { $sort: { _id: 1 } }
    ]).toArray();
    
    return result;
  } finally {
    await client.close();
  }
}

// Функция 2: Данные по континентам --- exercise asks for continents but data uses regions
async function getContinentData(year, age) {
  const client = new MongoClient('mongodb://localhost:27018');
  
  try {
    await client.connect();
    const collection = client.db('population_db').collection('population');
    
    const result = await collection.aggregate([
      { $match: { 
        Year: year,
        Age: age,
        Country: { 
          $in: [
            "AFRICA", "ASIA", "EUROPE", 
            "LATIN AMERICA AND THE CARIBBEAN", 
            "NORTHERN AMERICA", "OCEANIA"
          ] 
        }
      }},
      { $addFields: {
        TotalPopulation: { $add: ["$M", "$F"] }
      }},
      { $sort: { Country: 1 } }
    ]).toArray();
    
    return result;
  } finally {
    await client.close();
  }
}

// Тестирование обеих функций  --- test if needed
async function main() {
  console.log('=== Population by year for Netherlands ===');
  const netherlandsData = await getPopulationByYear("Netherlands");
  console.log(JSON.stringify(netherlandsData, null, 2));
  
  console.log('\n=== Continent data for 2020, age 100+ ===');
  const continentData = await getContinentData(2020, "100+");
  console.log(JSON.stringify(continentData, null, 2));
}

main().catch(console.error);
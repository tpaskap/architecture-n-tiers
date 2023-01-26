const database = {}


database.connect = async () => {
    /**
 * Import MongoClient & connexion à la DB
 */
    const MongoClient = require('mongodb').MongoClient;
    const url = 'mongodb://localhost:27017';
    let client = await MongoClient.connect(url,{ useNewUrlParser: true });
    console.log(client)
    let db = client.db('parkingApi');
    database.db = db
}

module.exports = database

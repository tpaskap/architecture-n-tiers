# Exemple simple

[TOC]

see https://welovedevs.com/fr/articles/api-node-js-mongodb/

## Prerequis

### Installation mongod wsl
sudo apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
echo "deb http://repo.mongodb.org/apt/debian bullseye/mongodb-org/6.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org

## Exploitation

### Lancement du server

Condition 1

```
PROJECT=$PWD
mkdir -p $PROJECT/data
mongod --dbpath $PROJECT/data 
```

Condition 2

### Import des données
mongoimport --jsonArray --db parkingApi --collection parkings --file $PROJECT/parkings.json

### Lancer l'API

```
node index.js
```

## Acces au données 

il faut Condition 1 et 2


### via mongoDB Compass : 

```
  mongodb://localhost:27017
```

### via mongosh

```
mongosh mongodb://localhost:27017
```

- Switched to db parkingApi

```
use parkingApi
```

- List collections

```
parkingApi> db.getCollectionInfos()
```

```json
[
  {
    name: 'parkings',
    type: 'collection',
    options: {},
    info: {
      readOnly: false,
      uuid: new UUID("ed88aa57-fb06-4361-bd45-6b0c33c68283")
    },
    idIndex: { v: 2, key: { _id: 1 }, name: '_id_' }
  }
]
```

- show collections

```
parkingApi> show collections
```

parkings

- Show data de la collection parkings de la base parkingApi

```
parkingApi> db.parkings.find()

```

### Via postman

- Récupérer tous les parkings

```
GET_ALL_PARKING : GET localhost:8080/parkings
```

```json
[
    {
        "id": 1,
        "name": "Parking 1",
        "type": "AIRPORT",
        "city": "ROISSY EN FRANCE"
    },
    {
        "id": 2,
        "name": "Parking 2",
        "type": "AIRPORT",
        "city": "BEAUVAIS"
    },
    {
        "id": 3,
        "name": "Parking 3",
        "type": "AIRPORT",
        "city": "ORLY"
    },
    {
        "id": 4,
        "name": "Parking 4",
        "type": "AIRPORT",
        "city": "NICE"
    },
    {
        "id": 5,
        "name": "Parking 5",
        "type": "AIRPORT",
        "city": "LILLE"
    }
]
```

- Récupérer un parking id 1

```
GET_ONE_PARKING : GET localhost:8080/parkings/1
```

```json
{
    "id": 1,
    "name": "Parking 1",
    "type": "AIRPORT",
    "city": "ROISSY EN FRANCE"
}
```

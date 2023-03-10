const express = require('express')
const app = express()
const routes = require('./routes')
const database = require('./database')

const db = Promise.resolve(database.connect())


app.use(express.json())
app.use(routes)

app.listen(8080, () => {
    console.log("Serveur à l'écoute")
})

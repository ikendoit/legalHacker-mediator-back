const express = require('express')
const routeConfig = require('./route-config')
const app = express()
const port = 8181
const fs = require('fs')

const data = fs.readFileSync('../dataMediate.json')
console.log(data)




app.get('/', (req, res) => res.send('Hello World!'))






app.listen(port, () => console.log(`Example app listening on port ${port}!`))

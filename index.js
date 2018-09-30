const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const port = 8181
const fs = require('fs')

app.use(bodyParser.json({ type: 'application/*' }))
app.use(bodyParser.text({ type: 'text/*' }))

// set env PG...
const {Client} = require('pg')
const client = new Client()
const { 
  user_create,
  user_signin, 
  user_signup, 
  get_users,
} = require('./routes/users')
const {
  get_list_questions,
  get_question,
  questions,
  set_allow_case,
} = require('./routes/questions')

client.connect()

client.query('select * from users', (err, res) => {
});

//set handler function
const schedule = async (req, res) => {
  try {
    const {schedule, user} = req.body
    const {date, note, question_id} = schedule
    const result = await client.query(
      `INSERT INTO meetings(date, note, user_id, question_id, allow) values \
        ('${date}','${note}','${user.id}','${question_id}')`
    )
    res.sendStatus(201)
  } catch(err) {
    console.log(err)
  }
}

const get_schedules = async (req, res) => {
  try {
    const result = await client.query('SELECT * FROM meetings')
    res.json(result)
  } catch(err) {
    console.log(err)
  }
}

const feedBack = (req, res) => {
  try {
    const {user, feedBack} = req.body
    const user_id = user.id
  } catch(err) {
    console.log(err)
  }
}

//set route
const routeConfig =  [
  ['/questions', async (req,res) => await questions(req, res, client), 'POST'],
  ['/questions_list', async (req,res) => await get_list_questions(req, res, client), 'GET'],
  ['/question_single/:question_id', async (req,res) => await get_question(req, res, client), 'GET'],
  ['/allow_case', async (req,res) => await set_allow_case(req, res, client), 'POST'],
  ['/feed_back', feedBack, 'POST'],
  ['/schedule', schedule, 'POST'],
  ['/schedule', get_schedules, 'GET'],
  ['/users', async (req,res) => await get_users(req,res,client), 'GET'],
  ['/signup', async (req,res) => await user_signup(req,res,client), 'POST'],
  ['/login', async (req,res) => await user_signin(req,res,client), 'POST'],
]

app.get('/', (req, res) => res.send('Hello World!'))

for (let route of routeConfig) {
  app[route[2].toLowerCase()](route[0], route[1])
}
//done set route

app.listen(port, () => console.log(`Listening on port ${port}!`))

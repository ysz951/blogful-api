require('dotenv').config()
const express = require('express')
const morgan = require('morgan')
const cors = require('cors')
const helmet = require('helmet')
const { NODE_ENV } = require('./config')
const errorHandler = require('./errorHandler')
const articlesRouter = require('./articles/articles-router')
const usersRouter = require('./users/users-router')
const commentsRouter = require('./comments/comments-router')

const app = express()


app.use(morgan((NODE_ENV === 'production') ? 'tiny' : 'common'))
app.use(cors())
app.use(helmet())


app.get('/', (req, res) => {
  res.send('Hello, world!')
})
app.use('/api/articles', articlesRouter)
app.use('/api/users', usersRouter)
app.use('/api/comments', commentsRouter)

app.get('/xss', (req, res) => {
  res.cookie('secretToken', '1234567890');
  res.sendFile(__dirname + '/xss-example.html');
});

app.use(errorHandler)

module.exports = app
const express = require('express')

const app = express()

const redisClient = require('./redis-client')

app.get('/store/:key', async (request, response) => {
  const { key } = request.params
  const value = request.query

  await redisClient.setAsync(key, JSON.stringify(value))

  return response.send('Success')
})

app.get('/:key', async (request, response) => {
  const { key } = request.params

  const rawData = await redisClient.getAsync(key)

  return response.json(JSON.parse(rawData))
})

app.get('/', (request, response) => {
  return response.send('Hello world')
})

const port = process.env.PORT || 3000

app.listen(port, () => {
  console.log(`Server listening on port ${port}`)
})

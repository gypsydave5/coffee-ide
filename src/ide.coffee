app = require('express')()
server = require('http').Server(app)


app.get '/', (request, response)->
  response.send """
  Here's my response
  """

module.exports = server
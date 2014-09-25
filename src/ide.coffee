app = require('express')()
server = require('http').Server(app)

app.set('views', __dirname + '/views')
app.set('view engine', 'jade')

app.use(require('express').static(__dirname + '/public'))

app.get '/', (request, response)->
  response.render 'index'

module.exports = server
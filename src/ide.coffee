app = require('express')()
server = require('http').Server(app)
Editor = require('./editor.coffee')

app.set('views', __dirname + '/views')
app.set('view engine', 'jade')
app.use(require('express').static(__dirname + '/public'))

editor = new Editor './code'

app.get '/', (request, response)->
  editor.listFiles (files)->
    response.render 'index', {files: files}

module.exports = server
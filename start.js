require('coffee-script/register')
ide = require('./src/ide.coffee')

port = process.env.port || 3000

var server = ide.listen(port, function() {
    console.log('Stand-by for action on port '+ port)
})

module.exports = server
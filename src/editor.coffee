process.env.NODE_ENV = 'test'
fs = require 'fs'

class Editor

  constructor: (dir)->
    @dir = dir

  listFiles: (callback)->
    fs.readdir(@dir, (err, files)->
      callback(files)
    )

module.exports = Editor



process.env.NODE_ENV = 'test'
expect = require('chai').expect
Editor = require('../src/editor.coffee')
fs = require 'fs'
test_dir = './test/code'

describe 'editor', ->
  editor = null

  before ->
    editor = new Editor(test_dir)

  describe 'reading files', ->
    before ->
      fs.writeFile("#{test_dir}/test1.rb", "console.log('test 1 content')", -> )
      fs.writeFile("#{test_dir}/test2.rb", "console.log('test 2 content')", -> )

    after ->
      fs.unlink("#{test_dir}/test1.rb", ->)
      fs.unlink("#{test_dir}/test2.rb", ->)

    it 'can list files', ->
      editor.listFiles((files)->
        expect(files).to.deep.equal(['test1.rb','test2.rb'])
      )

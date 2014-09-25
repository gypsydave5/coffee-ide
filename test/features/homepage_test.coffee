process.env.NODE_ENV = 'test'
fs = require 'fs'
expect = require('chai').expect
server = require('../../start.js')
Browser = require 'zombie'

describe 'The Coffeescript IDE', ->
  browser = null

  before ->
    browser = new Browser { site: 'http://localhost:3000' }
    fs.writeFile('code/testfile.js', "var _dummy = 'dummy'", ->)

  before (done) ->
    browser.visit '/', done

  after ->
    fs.unlink('code/testfile.js')

  it 'displays the welcome message', ->
    expect(browser.text('h1')).to.eq('Welcome to the Coffee IDE')

  it 'shows a list of files to edit', ->
    expect(browser.text('.files a:first-child')).to.eq('testfile.js')

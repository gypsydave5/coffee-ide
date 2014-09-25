process.env.NODE_ENV = 'test'
expect = require('chai').expect
server = require '../../start.js'
Browser = require 'zombie'

describe 'The Coffeescript IDE', ->
  browser = null

  it 'displays the welcome message', ->
    browser = new Browser {
      site: 'http://localhost:3000'
    }
    browser.visit '/'
    expect(browser.text('h1')).to.eq 'Welcome to Coffee IDE'

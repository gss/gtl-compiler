if typeof process is 'object' and process.title is 'node'
  chai = require 'chai' unless chai
  parser = require '../lib/gtl-compiler'
else
  parser = require 'gtl-compiler'

describe 'GTL compiler', ->
  it 'should provide a parse method', ->
    chai.expect(parser.parse).to.be.a 'function'
    
  describe 'with a simple layout', ->
    source = """
    @-gss-layout "frontpageLayout" {
      grid: "aaab"
            "aaab"
            "cccc";
      place-a: "#box1" "#box1";
    }
    """
    result = null
    it 'should be able to produce a result', ->
      result = parser.parse source
      chai.expect(result).to.be.an 'object'

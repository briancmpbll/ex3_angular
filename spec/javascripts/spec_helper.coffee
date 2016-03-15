#= require support/phantomjs-shims
#= require support/bind-poly
#= require application
#= require angular-mocks/angular-mocks
beforeEach module 'ex3-gen'

beforeEach ->
  jasmine.addMatchers toEqualData: (util, customEqualityTesters)->
    {
      compare: (actual, expected) ->
        result = {}
        result.pass = angular.equals(actual, expected)
        result
    }

  @getCompiledElement = (elementName)=>
    element = angular.element("<#{elementName}></#{elementName}>")
    compiledElement = @compile(element)(@scope)
    @digest()
    compiledElement

  @digest = =>
    @scope.$digest()

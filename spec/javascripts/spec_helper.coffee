#= require support/phantomjs-shims
#= require support/bind-poly
#= require application
#= require angular-mocks/angular-mocks
beforeEach module 'ex3-gen'

beforeEach ->
  jasmine.addMatchers
    toEqualData: (util, customEqualityTesters)->
      {
        compare: (actual, expected) ->
          result = {}
          result.pass = angular.equals(actual, expected)
          result
      }
    toHaveText: (util, customEqualityTesters)->
      {
        compare: (actual, expected) ->
          result = {}
          result.pass = actual.text().trim() == expected
          result
      }
    toHaveClass: (util, customEqualityTesters)->
      {
        compare: (actual, expected)->
          result = {}
          result.pass = actual.hasClass(expected)
          result
      }
    toBeVisible: (util, customEqualityTesters)->
      {
        compare: (actual)->
          result = {}
          result.pass = not actual.hasClass('ng-hide')
          result
      }
    toBeHidden: (util, customEqualityTesters)->
      {
        compare: (actual)->
          result = {}
          result.pass = actual.hasClass('ng-hide')
          result
      }

  @getCompiledElement = (elementName)=>
    element = angular.element("<#{elementName}></#{elementName}>")
    compiledElement = @compile(element)(@scope)
    @digest()
    compiledElement

  @digest = =>
    @scope.$digest()

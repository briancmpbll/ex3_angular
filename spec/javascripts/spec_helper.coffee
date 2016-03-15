#= require support/phantomjs-shims
#= require support/bind-poly
#= require application
#= require angular-mocks/angular-mocks
beforeEach module 'ex3-gen'

# beforeEach inject (
#   $httpBackend
#   $compile
#   $rootScope
#   $controller
#   $location
#   $injector
#   $timeout)->
#     @scope = $rootScope.$new()
#     @http = $httpBackend
#     @compile = $compile
#     @location = $location
#     @controller = $controller
#     @injector = $injector
#     @timeout = $timeout
#     @model = (name)=>
#       @injector.get(name)
#     @eventLoop =
#       flush: =>
#         @scope.$digest()

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
    @eventLoop.flush()
    compiledElement

# afterEach ->
#   @http.resetExpectations()
#   @http.verifyNoOutstandingExpectation

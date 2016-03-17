#= require support/phantomjs-shims
#= require support/bind-poly
#= require application
#= require angular-mocks/angular-mocks
beforeEach module 'ex3-gen'

beforeEach ->
  jasmine.addMatchers
    toEqualData: (util, customEqualityTesters)->
      {
        compare: (actual, expected)->
          result = {}
          result.pass = angular.equals(actual, expected)
          result
      }
    toHaveText: (util, customEqualityTesters)->
      {
        compare: (actual, expected)->
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
    toHaveElements: (util, customEqualityTesters)->
      {
        compare: (actual, expected)->
          result = {}
          result.pass = not expected.some (elem)-> actual.find(elem).length == 0
          result
      }

  @getCompiledElement = (elementName)=>
    element = angular.element("<#{elementName}></#{elementName}>")
    compiledElement = @compile(element)(@scope)
    @digest()
    compiledElement

  @digest = =>
    @scope.$digest()

  @mockUserService = ->
    module ($provide)->
      $provide.factory('UserService', ->
        service = {}
        service.data = {currentUser: {}}
        service.login = jasmine.createSpy('login')
        service.register = jasmine.createSpy('register')
        service.logout = jasmine.createSpy('logout')
        service.loggedIn = jasmine.createSpy('loggedIn').and.callFake( ->
          not angular.equals(@data.currentUser, {})
        )
        service
      )
      return

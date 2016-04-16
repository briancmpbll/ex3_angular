#= require support/phantomjs-shims
#= require support/bind-poly
#= require application
#= require angular-mocks/angular-mocks

'use strict'

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
    toContainText: (util, customEqualityTesters)->
      {
        compare: (actual, expected)->
          result = {}
          result.pass = actual.text().indexOf(expected) != -1
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
    toHaveSref: (util, customEqualityTesters)->
      {
        compare: (actual, expected)->
          result = {}
          result.pass = actual.attr('ui-sref') == expected
          result
      }

  @injectCommon = ->
    inject ($rootScope, $compile, $httpBackend, $state, $stateParams,
      $controller)->
        @rootScope = $rootScope
        @scope = $rootScope.$new()
        @compile = $compile
        @http = $httpBackend
        @state = $state
        @stateParams = $stateParams
        @controller = $controller

        spyOn(@state, 'go')

  @getCompiledElement = (elementName, args)=>
    element = angular.element("<#{elementName} #{args}></#{elementName}>")
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

  @injectUserService = ->
    inject (UserService)->
      @UserService = UserService

  @mockCharacterService = ->
    module ($provide)->
      $provide.factory('CharacterService', ($q)->
        service = {}
        service.data = {}
        service.query = jasmine.createSpy('query').and.callFake(
          (params, success, error)->
            deferred = $q.defer()
            deferred.promise.then(success, error)
            deferred.resolve(service.data)
        )
        service.get = jasmine.createSpy('get').and.callFake(
          (params, success, error)->
            deferred = $q.defer()
            deferred.promise.then(success, error)
            deferred.resolve(service.data)
        )
        service
      )
      return

  @injectCharacterService = ->
    inject (CharacterService)->
      @CharacterService = CharacterService

  @mockStaticData = ->
    module ($provide)=>
      $provide.factory('Abilities', =>
        @abilityData
      )
      $provide.factory('AttributeCategories', =>
        @categoryData
      )
      $provide.factory('CharacterTypes', =>
        @typeData
      )
      return

  @injectStaticData = ->
    inject (Abilities, AttributeCategories, CharacterTypes)->
      @Abilities = Abilities
      @AttributeCategories = AttributeCategories
      @CharacterTypes = CharacterTypes

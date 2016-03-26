'use strict'

describe 'the user service', ->
  badCredsError = 'Invalid username/password combination.'
  unknownError = 'An unknown error occurred. Please try again later
    or contact the administrator.'

  testUser =
    email: 'test@test.com'
    username: 'test'
    password: 'test'

  beforeEach ->
    module ($provide)=>
      $provide.factory('Auth', ($q)=>
        service =
          login: jasmine.createSpy('login').and.callFake( (credentials)=>
            return $q.when(credentials) if @errorStatus == 0
            $q.reject({status: @errorStatus})
          )
          logout: jasmine.createSpy('logout').and.callFake( =>
            return $q.when(testUser) if @errorStatus == 0
            $q.reject({status: @errorStatus})
          )
          register: jasmine.createSpy('register').and.callFake( (credentials)=>
            return $q.when(credentials) if @errorStatus == 0
            $q.reject(
              status: @errorStatus
              data: {errors: @errors}
            )
          )
          currentUser: jasmine.createSpy('currentUser').and.callFake( =>
            return $q.when(testUser) if @errorStatus == 0
            $q.reject({status: @errorStatus})
          )
          isAuthenticated: jasmine.createSpy('isAuthenticated').and.returnValue(true)
      )
      return

    @injectServices = ->
      @injectCommon()
      inject (Auth, Flash, changeCase, UserService)->
        @Auth = Auth
        @Flash = Flash
        @changeCase = changeCase
        @UserService = UserService

        spyOn(@Flash, 'create')
        spyOn(@state, 'go')

  describe 'with an autheticated user', ->
    beforeEach ->
      @errorStatus = 0
      @injectServices()
      @digest()

    it 'should set the user', ->
      expect(@Auth.currentUser).toHaveBeenCalled()
      expect(@UserService.data.currentUser).toEqualData(testUser)

    describe 'after successfully logging out', ->
      beforeEach ->
        @errorStatus = 0
        @UserService.logout()
        @digest()

      it 'should call logout', ->
        expect(@Auth.logout).toHaveBeenCalled()
      it 'should unset the user', ->
        expect(@UserService.data.currentUser).toEqual({})

  describe 'with no authenticated user', ->
    beforeEach ->
      @errorStatus = 401
      @injectServices()

    it 'should not set the user', ->
      @digest()
      expect(@Auth.currentUser).toHaveBeenCalled()
      expect(@UserService.data.currentUser).toEqualData({})

    describe 'after a successful login', ->
      beforeEach ->
        @errorStatus = 0
        @UserService.login(testUser)
        @digest()

      it 'should set the right user', ->
        expect(@UserService.data.currentUser).toEqualData(testUser)
      it 'should try to login the right user', ->
        expect(@Auth.login).toHaveBeenCalledWith(testUser)
      it 'should show the correct flash message', ->
        expect(@Flash.create).toHaveBeenCalledWith('success', 'Welcome back test!')
      it 'should go to the index', ->
        expect(@state.go).toHaveBeenCalledWith('index')

    describe 'after an unsuccessful login', ->
      beforeEach ->
        @errorStatus = 401
        @UserService.login(testUser)
        @digest()

      it 'should not set the user', ->
        expect(@UserService.data.currentUser).toEqualData({})
      it 'should show the bad credentials flash message', ->
        expect(@Flash.create).toHaveBeenCalledWith('danger', badCredsError)
      it 'should not forward', ->
        expect(@state.go).not.toHaveBeenCalled()

    describe 'after an unknown login error', ->
      beforeEach ->
        @errorStatus = 100
        @UserService.login(testUser)
        @digest()

      it 'should not set the user', ->
        expect(@UserService.data.currentUser).toEqualData({})
      it 'should show the unknown error flash message', ->
        expect(@Flash.create).toHaveBeenCalledWith('danger', unknownError)
      it 'should not forward', ->
        expect(@state.go).not.toHaveBeenCalled()

    describe 'after a successful registration', ->
      beforeEach ->
        @errorStatus = 0
        @UserService.register(testUser)
        @digest()

      it 'should set the right user', ->
        expect(@UserService.data.currentUser).toEqualData(testUser)
      it 'should try to register with the right user', ->
        expect(@Auth.register).toHaveBeenCalledWith(testUser)

    describe 'after an unsuccessful registration', ->
      beforeEach ->
        @errorStatus = 401
        @errors =
          email: ['has already been taken']
        @UserService.register(testUser)
        @digest()

      it 'should not set the user', ->
        expect(@UserService.data.currentUser).toEqualData({})
      it 'should show show a message containing errors', ->
        expect(@Flash.create).toHaveBeenCalledWith('danger',
          '<ul><li>Email has already been taken</li></ul>')
      it 'should not forward', ->
        expect(@state.go).not.toHaveBeenCalled()

    describe 'after an unknown registration error', ->
      beforeEach ->
        @errorStatus = 100
        @UserService.register(testUser)
        @digest()

      it 'should not set the user', ->
        expect(@UserService.data.currentUser).toEqualData({})
      it 'should show show the unknown erro message', ->
        expect(@Flash.create).toHaveBeenCalledWith('danger', unknownError)
      it 'should not forward', ->
        expect(@state.go).not.toHaveBeenCalled()

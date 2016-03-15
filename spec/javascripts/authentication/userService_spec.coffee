describe 'the user service', ->
  badCredsError = 'Invalid username/password combination.'
  unknownError = 'An unknown error occurred. Please try again later or contact the administrator.'

  testUser =
    email: 'test@test.com'
    username: 'test'
    password: 'test'

  beforeEach ->
    @errorStatus = 401
    @errors = []

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

  beforeEach inject ($rootScope, $state, Auth, Flash, changeCase, UserService)->
    @scope = $rootScope.$new()
    @state = $state
    @Auth = Auth
    @Flash = Flash
    @changeCase = changeCase
    @UserService = UserService

    spyOn(@Flash, 'create')
    spyOn(@state, 'go')

  it 'should not set the user if there is no user authenticated', ->
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

  describe 'after an unknown error', ->
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

  describe 'after successfully logging out', ->
    beforeEach ->
      @errorStatus = 0
      @UserService.data.currentUser = testUser
      @UserService.logout()
      @digest()

    it 'should call logout', ->
      expect(@Auth.logout).toHaveBeenCalled()
    it 'should unset the user', ->
      expect(@UserService.data.currentUser).toEqual({})

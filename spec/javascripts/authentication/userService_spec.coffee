describe 'the user service', ->
  beforeEach ->
    @expectedUser =
      email: 'test@test.com'
      username: 'test'
    @errorStatus = 401
    @errors = null

    module ($provide)=>
      $provide.factory('Auth', ($q)=>
        service =
          currentUser: jasmine.createSpy('currentUser').and.callFake( =>
            return $q.when(@expectedUser) if @expectedUser?
            $q.reject()
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

    # inject (Auth, UserService, $q)->
    #   @Auth = Auth

    #   spyOn(@Auth, 'login').and.callFake( (credentials)=>
    #     $q.when(@expectedUser) if @expectedUser?
    #     $q.reject(
    #       status: @errorStatus
    #     )
    #   )
    #   spyOn(@Auth, 'logout').and.callFake( =>
    #     $q.when(@expectedUser) if @expectedUser?
    #     $q.reject(
    #       status: @errorStatus
    #     )
    #   )
    #   spyOn(@Auth, 'register').and.callFake( (credentials)=>
    #     $q.when(@expectedUser) if @expectedUser?
    #     $q.reject(
    #       status: @errorStatus
    #       data:
    #         errors: @errors
    #     )
    #   )
    #   spyOn(@Auth, 'currentUser').and.callFake( =>
    #     $q.when(@expectedUser) if @expectedUser?
    #     $q.reject(
    #       status: @errorStatus
    #     )
    #   )
    #   spyOn(@Auth, 'isAuthenticated').and.callFake( =>
    #     @expectedUser?
    #   )

    #   @UserService = UserService

  it 'should have no current user if there is none', ->
    @scope.$digest()
    expect(@Auth.currentUser).toHaveBeenCalled()
    expect(@UserService.data.currentUser).toEqualData(@expectedUser)

  it 'should login a valid user', ->
    @expectedUser =
      email: 'test@test.com'
      username: 'test'
    # @UserService.login(
    #   email:'test@test.com'
    #   password: 'password'
    # )

    # this.scope.$digest
    # expect(this.Auth.login).toHaveBeenCalled()

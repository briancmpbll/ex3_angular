describe 'the login controller', ->
  beforeEach ->
    @mockUserService()
    @injectCommon()
    @injectUserService()

    @loginController = @controller('LoginController',
      '$scope': @scope
      'UserService': @UserService
    )

    @user =
      email: ''
      password: ''
      remember_me: false

  it 'should have an empty user', ->
    expect(@scope.user).toEqualData(@user)

  describe 'login function', ->
    beforeEach ->
      @scope.user.email = @user.email = 'test@test.com'
      @scope.user.password = @user.password = 'testtest'
      @scope.user.remember_me = @user.remember_me = true

      @scope.login()

    it 'should call the UserService login function', ->
      expect(@UserService.login).toHaveBeenCalledWith(@user)

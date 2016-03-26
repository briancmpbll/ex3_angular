'use strict'

describe 'the signup controller', ->
  beforeEach ->
    @mockUserService()
    @injectCommon()
    @injectUserService()

    @signupController = @controller('SignupController',
      '$scope': @scope
      'UserService': @UserService
    )

    @user =
      email: ''
      username: ''
      password: ''
      password_confirmation: ''

  it 'should have an empty user', ->
    expect(@scope.user).toEqualData(@user)

  describe 'register function', ->
    beforeEach ->
      @scope.user.email = @user.email = 'test@test.com'
      @scope.user.username = @user.username = 'test'
      @scope.user.password = @user.password = 'testtest'
      @scope.user.password_confirmation = @user.password_confirmation = 'testtest'

      @scope.register()

    it 'should call the UserService register function', ->
      expect(@UserService.register).toHaveBeenCalledWith(@user)

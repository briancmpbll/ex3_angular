describe 'the navigation bar', ->
  beforeEach ->
    # Mock the UserService
    module ($provide)->
      $provide.factory('UserService', ->
        service = {}
        service.data = {currentUser: {}}
        service.login = jasmine.createSpy('login')
        service.register = jasmine.createSpy('register')
        service.logout = jasmine.createSpy('logout')
        service.loggedIn = jasmine.createSpy('loggedIn').and.callFake( ->
          not angular.equals(service.data.currentUser, {})
        )
        service
      )
      return

    inject ($rootScope, $compile, UserService)->
      @scope = $rootScope.$new()
      @compile = $compile
      @UserService = UserService

    @directiveElem = @getCompiledElement('navigation-bar')

    @findNavbarElements = ->
      navbarRight = @directiveElem.find('.navbar-right')
      @usersLink = navbarRight.find('#nav-users')
      @userDropdown = navbarRight.find('#nav-user-dropdown')
      @loginLink = navbarRight.find('#nav-login')
      @signupLink = navbarRight.find('#nav-signup')

  it 'should have navbar-brand', ->
    brandElement = @directiveElem.find('.navbar-brand')
    expect(brandElement).toHaveText('Exalted Generator')

  it 'should have all the menu elements', ->
    expect(@directiveElem).toHaveElements([
      '#nav-home', '#nav-users', '#nav-user-dropdown', '#nav-login', '#nav-signup'
    ])

  it 'should call loggedIn on compilation', ->
    expect(@UserService.loggedIn).toHaveBeenCalled()

  describe 'when no user is logged in', ->
    beforeEach ->
      @findNavbarElements()

    it 'should not have a user', ->
      expect(@scope.data.currentUser).toEqualData({})

    it 'should not be logged in', ->
      expect(@scope.loggedIn).toBeFalsy()

    it 'should hide the users link', ->
      expect(@usersLink).toBeHidden()

    it 'should hide the user dropdown', ->
      expect(@userDropdown).toBeHidden()

    it 'should show the login link', ->
      expect(@loginLink).toBeVisible()

    it 'should show the signup link', ->
      expect(@signupLink).toBeVisible()

  describe 'when a user is logged in', ->
    beforeEach ->
      @UserService.loggedIn.calls.reset()
      @currentUser =
        username: 'test'
      @UserService.data.currentUser = @currentUser
      @digest()
      @findNavbarElements()

    it 'should call loggedIn', ->
      expect(@UserService.loggedIn).toHaveBeenCalled()

    it 'should have a user', ->
      expect(@scope.data.currentUser).toEqualData(@currentUser)

    it 'should be logged in', ->
      expect(@scope.loggedIn).toBeTruthy()

    it 'should show the users link', ->
      expect(@usersLink).toBeVisible()

    it 'should show the user dropdown', ->
      expect(@userDropdown).toBeVisible()

    it 'should show the username on the user dropdown', ->
      expect(@userDropdown.find('.dropdown-toggle')).toHaveText(@currentUser.username)

    it 'should hide the login link', ->
      expect(@loginLink).toBeHidden()

    it 'should hide the signup link', ->
      expect(@signupLink).toBeHidden()

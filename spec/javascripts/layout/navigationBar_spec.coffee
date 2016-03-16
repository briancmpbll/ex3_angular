describe 'the navigation bar', ->
  beforeEach ->
    module ($provide)->
      $provide.factory('UserService', ->
        service = {}
        service.data = {currentUser: {}}
        service.login = jasmine.createSpy('login')
        service.register = jasmine.createSpy('register')
        service.logout = jasmine.createSpy('logout')
        service.loggedIn = jasmine.createSpy('loggedIn').and.returnValue(
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

  it 'should have navbar-brand', ->
    brandElement = @directiveElem.find('.navbar-brand')
    expect(brandElement).toBeDefined()
    expect(brandElement.text()).toEqual('Exalted Generator')

  it 'should have a left section of the navbar', ->
    navbarLeft = @directiveElem.find('.navbar-left')
    expect(navbarLeft).toBeDefined()
    expect(navbarLeft.html()).toContain('Home')

  it 'should call loggedIn on construction', ->
    expect(@UserService.loggedIn).toHaveBeenCalled()

  describe 'without a logged in user', ->
    it 'should not have a user', ->
      expect(@scope.data.currentUser).toEqualData({})

    it 'should show the non member navbar', ->
      navbarRight = @directiveElem.find('.navbar-right')
      expect(navbarRight.html()).toContain('Log In')
      expect(navbarRight.html()).toContain('Sign Up')

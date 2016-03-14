describe 'navigation bar directive', ->
  beforeEach ->
    inject( ($compile, $rootScope, _UserService_, $q)->
      this.scope = $rootScope.$new()
      this.compile = $compile
    )

    this.directiveElem = this.getCompiledElement('navigation-bar')

  # it 'should have navbar-brand', ->
  #   brandElement = this.directiveElem.find('.navbar-brand')
  #   expect(brandElement).toBeDefined()
  #   expect(brandElement.text()).toEqual('Exalted Generator')

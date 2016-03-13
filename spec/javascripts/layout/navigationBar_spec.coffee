describe 'navigation bar directive', ->
  beforeEach( ->
    module('ex3-gen')

    inject( ($compile, $rootScope)->
      this.scope = $rootScope.$new()
      this.compile = $compile
    )

    this.directiveElem = this.getCompiledElement('navigation-bar')
  )

  it 'should have navbar-brand', ->
    brandElement = this.directiveElem.find('.navbar-brand')
    expect(brandElement).toBeDefined()
    expect(brandElement.text()).toEqual('Exalted Generator')

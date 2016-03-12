describe "pageFooter directive", ->
  beforeEach( ->
    module('ex3-gen')

    inject( ($compile, $rootScope)->
      this.scope = $rootScope.$new()
      this.compile = $compile
    )

    this.directiveElem = this.getCompiledElement('page-footer')
  )

  it 'should have a small element', ->
    smallElement = this.directiveElem.find('small')
    expect(smallElement).toBeDefined()
    expect(smallElement.text().trim()).toEqual('The Exalted Generator by Brian Campbell')

  it 'should have a nav bar', ->
    navElement = this.directiveElem.find('nav')
    expect(navElement).toBeDefined()
    expect(navElement.text()).toContain('About')
    expect(navElement.text()).toContain('Contact')

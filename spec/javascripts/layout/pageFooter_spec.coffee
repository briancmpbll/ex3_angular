describe "pageFooter directive", ->
  scope = null
  compile = null
  directiveElem = null

  beforeEach( ->
    module('ex3-gen')

    inject( ($compile, $rootScope)->
      scope = $rootScope.$new()
      compile = $compile
    )

    directiveElem = getCompiledElement()
  )

  getCompiledElement = ->
    element = angular.element('<page-footer></page-footer>')
    compiledElement = compile(element)(scope)
    scope.$digest()
    compiledElement

  it 'should have small element', ->
    smallElement = directiveElem.find('small')
    expect(smallElement).toBeDefined()
    expect(smallElement.text().trim()).toEqual('The Exalted Generator by Brian Campbell')

  it 'should have a nav bar', ->
    navElement = directiveElem.find('nav')
    expect(navElement).toBeDefined()
    expect(navElement.text()).toContain('About')
    expect(navElement.text()).toContain('Contact')

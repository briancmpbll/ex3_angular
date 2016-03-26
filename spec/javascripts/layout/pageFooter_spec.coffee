'use strict'

describe "pageFooter directive", ->
  beforeEach ->
    @injectCommon()

    @directiveElem = @getCompiledElement('page-footer')

  it 'should have a small element', ->
    smallElement = @directiveElem.find('small')
    expect(smallElement).toBeDefined()
    expect(smallElement.text().trim()).toEqual('The Exalted Generator by Brian Campbell')

  it 'should have a nav bar', ->
    navElement = @directiveElem.find('nav')
    expect(navElement).toBeDefined()
    expect(navElement.text()).toContain('About')
    expect(navElement.text()).toContain('Contact')

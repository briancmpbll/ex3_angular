'use strict'

describe 'the casteIcon directive', ->
  beforeEach ->
    @injectCommon()

    @fixtures = fixture.load(
      'castes.json'
      true
    )

    @scope.caste = @fixtures[0][1]

    @directiveElem = @getCompiledElement('caste-icon',
      'caste="caste"')

    @imgElem = @directiveElem.children().first()

    @innerScope = @directiveElem.isolateScope()

  it 'should set the correct icon', ->
    expect(@imgElem.attr('src')).toEqual(@scope.caste.icon)

  it 'should set the alt', ->
    expect(@imgElem.attr('alt')).toEqual("#{@scope.caste.name} Icon")

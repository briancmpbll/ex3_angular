'use strict'

fixture.preload('character.json')

describe 'the conceptPanel directive', ->
  beforeEach ->
    @injectCommon()

    @fixtures = fixture.load(
      'character.json'
      true
    )

    @scope.character = @fixtures[0]

    @directiveElem = @getCompiledElement('concept-panel',
      'character="character"')

    @panelElem = @directiveElem.children().first()

    @innerScope = @directiveElem.isolateScope()

  it 'should have a default panel', ->
    expect(@panelElem).toHaveClass('panel')
    expect(@panelElem).toHaveClass('panel-default')

  it 'should set the inner scope attributes', ->
    expect(@innerScope.character).toEqualData(@scope.character)

  it 'should contain the character name', ->
    expect(@panelElem).toContainText(@scope.character.name)

  it 'should contain the character concept', ->
    expect(@panelElem).toContainText(@scope.character.concept)

  describe 'changing the outer scope', ->
    beforeEach ->
      @scope.character.name = 'New Character'
      @scope.character.caste = '2'
      @scope.character.attributes['1'] = 4
      @scope.character.abilities['2'] = 2

    it 'should change the inner scope', ->
      expect(@innerScope.character).toEqualData(@scope.character)

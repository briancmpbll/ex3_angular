'use strict'

describe 'the conceptPanel directive', ->
  beforeEach ->
    @injectCommon()

    @fixtures = fixture.load(
      'character.json'
      'castes.json'
      true
    )

    @scope.character = @fixtures[0]
    @scope.castes = @fixtures[1]

    @directiveElem = @getCompiledElement('concept-panel',
      'character="character" castes="castes"')

    @panelElem = @directiveElem.children().first()

    @innerScope = @directiveElem.isolateScope()

  it 'should have a default panel', ->
    expect(@panelElem).toHaveClass('panel')
    expect(@panelElem).toHaveClass('panel-default')

  it 'should set the inner scope attributes', ->
    expect(@innerScope.character).toEqualData(@scope.character)
    expect(@innerScope.castes).toEqualData(@scope.castes)

  it 'should contain the character name', ->
    expect(@panelElem).toContainText(@scope.character.name)

  it 'should contain the character concept', ->
    expect(@panelElem).toContainText(@scope.character.concept)

  it 'should contain the caste name', ->
    expect(@panelElem).toContainText(@scope.castes[@scope.character.caste].name)

  it 'should contain the character player', ->
    expect(@panelElem).toContainText(@scope.character.player)

  it 'should contain the character anima', ->
    expect(@panelElem).toContainText(@scope.character.anima)

  describe 'changing the outer scope', ->
    beforeEach ->
      @scope.character.name = 'New Character'
      @scope.character.caste = '2'
      @scope.character.attributes['1'] = 4
      @scope.character.abilities['2'] = 2

    it 'should change the inner scope', ->
      expect(@innerScope.character).toEqualData(@scope.character)

'use strict'

describe 'the abilityPanel directive', ->
  beforeEach ->
    @injectCommon()

    @scope.abilities =
      '1': 'Ability1'
      '2': 'Ability2'
      '3': 'Ability3'
    @scope.character =
      'abilities':
        '1': 2
        '2': 4
        '3': 1

    @directiveElem = @getCompiledElement('ability-panel',
      'abilities="abilities" character="character"')
    @panelElem = @directiveElem.children().first()

    @innerScope = @directiveElem.isolateScope()

  it 'should have a default panel', ->
    expect(@panelElem).toHaveClass('panel')
    expect(@panelElem).toHaveClass('panel-default')

  it 'should have a panel header', ->
    headerElem = @panelElem.find('.panel-header')
    expect(headerElem.find('h2')).toHaveText('Abilities')

  it 'should set the inner scope attributes', ->
    expect(@innerScope.abilities).toEqualData(@scope.abilities)
    expect(@innerScope.character).toEqualData(@scope.character)

  describe 'the panel body', ->
    beforeEach ->
      @panelBody = @panelElem.find('.panel-body')

    it 'should have an ability row for each ability', ->
      expect(@panelBody.find('.row').length).toEqual(3)

    it 'should display each ability', ->
      for id, ability of @scope.abilities
        rowElem = @panelBody.find("trait-control:contains(#{ability})")
        traitControl = rowElem.find('span')
        expect(traitControl.attr('aria-valuenow')).toEqual(
          @scope.character['abilities'][id].toString())

  describe 'changing the inner scope', ->
    beforeEach ->
      @innerScope.character['abilities']['1'] = 3

    it 'should change the outer scope', ->
      expect(@scope.character['abilities']['1']).toEqual(3)

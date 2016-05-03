'use strict'

fixture.preload('attribute_categories.json', 'character.json')

describe 'the attributePanel directive', ->
  beforeEach ->
    @injectCommon()

    @fixtures = fixture.load(
      'attribute_categories.json'
      'character.json'
      true)

    @scope.categories = @fixtures[0]
    @scope.character = @fixtures[1]

    @directiveElem = @getCompiledElement('attribute-panel',
      'categories="categories" character="character"')

    @panelElem = @directiveElem.children().first()

    @innerScope = @directiveElem.isolateScope()

  it 'should have a default panel', ->
    expect(@panelElem).toHaveClass('panel')
    expect(@panelElem).toHaveClass('panel-default')

  it 'should have a panel header', ->
    headerElem = @panelElem.find('.panel-header')
    expect(headerElem.find('h2')).toHaveText('Attributes')

  it 'should set the inner scope attributes', ->
    expect(@innerScope.categories).toEqualData(@scope.categories)
    expect(@innerScope.character).toEqualData(@scope.character)

  describe 'the panel body', ->
    beforeEach ->
      @panelBody = @panelElem.find('.panel-body')

    it 'should display each attribute', ->
      for id, category of @scope.categories
        columnElem = @panelBody.find(".col-xs-4[name='#{category.name}']")
        for attrId, attribute of category.attributes
          rowElem = columnElem.find(".row:contains(#{attribute})")
          traitControl = rowElem.find('trait-control span')
          expect(traitControl.attr('aria-valuenow')).toEqual(
            @scope.character['attributes'][attrId].toString())

  describe 'changing the inner scope', ->
    beforeEach ->
      @innerScope.character['attributes']['1'] = 5

    it 'should change the outer scope', ->
      expect(@scope.character['attributes']['1']).toEqual(5)

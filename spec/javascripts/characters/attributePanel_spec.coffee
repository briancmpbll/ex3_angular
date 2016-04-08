'use strict'

describe 'the attributePanel directive', ->
  beforeEach ->
    @injectCommon()

    @scope.categories =
      '1':
        name: 'Category1'
        attributes:
          '1': 'Attribute1'
          '2': 'Attribute2'
          '3': 'Attribute3'
      '2':
        name: 'Category2'
        attributes:
          '4': 'Attribute4'
          '5': 'Attribute5'
          '6': 'Attribute6'
      '3':
        name: 'Category3'
        attributes:
          '7': 'Attribute7'
          '8': 'Attribute8'
          '9': 'Attribute9'

    @scope.character =
      'attributes':
        '1': 3
        '2': 1
        '3': 2
        '4': 3
        '5': 2
        '6': 4
        '7': 3
        '8': 4
        '9': 5

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

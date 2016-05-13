'use strict'

describe 'the character detail controller', ->
  beforeEach ->
    @fixtures = fixture.load(
      'character.json'
      'attribute_categories.json'
      'abilities.json'
    )

    @character = @fixtures[0]
    @attributeCategories = @fixtures[1]
    @abilities = @fixtures[2]

    @injectCommon()

    @characterDetailController = @controller('CharacterDetailController',
      '$scope': @scope
      'character': @character
      'attributeCategories': @attributeCategories
      'abilities': @abilities
    )

  it 'should set the attribute categories', ->
    expect(@scope.attributeCategories).toEqualData(@attributeCategories)

  it 'should set the abilities', ->
    expect(@scope.abilities).toEqualData(@abilities)

  it 'should set the scope character', ->
    @digest()
    expect(@scope.character).toEqualData(@character)

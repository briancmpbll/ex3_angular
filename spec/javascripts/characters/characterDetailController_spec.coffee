'use strict'

fixture.preload(
  'abilities.json'
  'attribute_categories.json'
  'character_types.json'
  'character.json')

describe 'the character detail controller', ->
  beforeEach ->
    @mockCharacterService()
    @mockStaticData()

    @fixtures = fixture.load(
      'abilities.json'
      'attribute_categories.json'
      'character_types.json'
      'character.json')

    @abilityData = @fixtures[0]
    @categoryData = @fixtures[1]
    @typeData = @fixtures[2]

    @injectCommon()
    @injectCharacterService()
    @injectStaticData()

    @CharacterService.data = @fixtures[3]

    @stateParams.id = 4

    @characterDetailController = @controller('CharacterDetailController',
      '$scope': @scope
      '$stateParams': @stateParams
      'CharacterService': @CharacterService
      'AttributeCategories': @AttributeCategories
      'Abilities': @Abilities
    )

  it 'should set the attribute categories', ->
    expect(@scope.attributeCategories).toEqualData(@categoryData)

  it 'should set the abilities', ->
    expect(@scope.abilities).toEqualData(@abilityData)

  it 'should set the character types', ->
    expect(@scope.characterTypes).toEqualData(@typeData)

  it 'should get a character on construction', ->
    expect(@CharacterService.get).toHaveBeenCalledWith(
      {id: 4}, jasmine.any(Function))

  it 'should set the scope character', ->
    @digest()
    expect(@scope.character).toEqualData(@CharacterService.data)

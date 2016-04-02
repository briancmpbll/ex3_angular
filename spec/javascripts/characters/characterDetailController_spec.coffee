'use strict'

describe 'the character detail controller', ->
  beforeEach ->
    @mockCharacterService()
    @mockStaticData()

    @abilityData =
      '1': 'Ability1'
      '2': 'Ability2'
      '3': 'Ability3'

    @categoryData =
      '1':
        name: 'Category1'
        attributes:
          '1': 'Attribute1'
          '2': 'Attribute2'

    @injectCommon()
    @injectCharacterService()
    @injectStaticData()

    @CharacterService.data =
      'name': 'Cool character'
      'abilities':
        '1': 5
        '2': 3

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

  it 'should get a character on construction', ->
    expect(@CharacterService.get).toHaveBeenCalledWith(
      {id: 4}, jasmine.any(Function))

  it 'should set the scope character', ->
    @digest()
    expect(@scope.character).toEqualData(@CharacterService.data)

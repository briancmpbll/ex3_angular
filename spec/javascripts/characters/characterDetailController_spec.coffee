'use strict'

describe 'the character detail controller', ->
  beforeEach ->
    @mockCharacterService()
    @injectCommon()
    @injectCharacterService()

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
    )

    @digest()

  it 'should call get on construction', ->
    expect(@CharacterService.get).toHaveBeenCalledWith(
      {id: 4}, jasmine.any(Function))

  it 'should set the scope character', ->
    expect(@scope.character).toEqualData(@CharacterService.data)

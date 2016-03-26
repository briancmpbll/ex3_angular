'use strict'

describe ' the characters controller', ->
  beforeEach ->
    @mockCharacterService()
    @injectCommon()
    @injectCharacterService()

    @CharacterService.data =
      total: 3
      characters: [
        {id: 1, name: 'Test 1', concept: 'Concept 1'}
        {id: 2, name: 'Test 2', concept: 'Concept 2'}
        {id: 3, name: 'Test 3', concept: 'Concept 3'}
      ]

    @characterIndexController = @controller('CharacterIndexController',
      '$scope': @scope
      'CharacterService': @CharacterService
    )

    @digest()

  it 'should call query on construction', ->
    expect(@CharacterService.query).toHaveBeenCalled()

  it 'should set scope characters variable', ->
    expect(@scope.characters).toEqualData(@CharacterService.data.characters)

  it 'should set scope total variable', ->
    expect(@scope.total).toEqualData(@CharacterService.data.total)

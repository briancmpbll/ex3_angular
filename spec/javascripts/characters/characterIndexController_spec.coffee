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

  it 'should default to page 1', ->
    expect(@scope.currentPage).toEqual(1)

  it 'should default to 10 characters per page', ->
    expect(@scope.charactersPerPage).toEqual(10)

  it 'should call query on construction', ->
    expect(@CharacterService.query).toHaveBeenCalledWith({page: 1},
      jasmine.any(Function))

  it 'should set scope characters variable', ->
    expect(@scope.characters).toEqualData(@CharacterService.data.characters)

  it 'should set scope total variable', ->
    expect(@scope.totalCharacters).toEqualData(@CharacterService.data.total)

  describe 'changing the page', ->
    beforeEach ->
      @CharacterService.data =
        total: 6
        characters: [
          {id: 4, name: 'Test 1', concept: 'Concept 1'}
          {id: 5, name: 'Test 5', concept: 'Concept 5'}
          {id: 6, name: 'Test 6', concept: 'Concept 6'}
        ]

      @scope.changePage(2)
      @digest()

    it 'should call query', ->
      expect(@CharacterService.query).toHaveBeenCalledWith({page: 2},
        jasmine.any(Function))

    it 'should set the characters', ->
      expect(@scope.characters).toEqualData(@CharacterService.data.characters)

    it 'should set the total characters', ->
      expect(@scope.totalCharacters).toEqualData(@CharacterService.data.total)

    it 'should set the current page', ->
      expect(@scope.currentPage).toEqualData(2)

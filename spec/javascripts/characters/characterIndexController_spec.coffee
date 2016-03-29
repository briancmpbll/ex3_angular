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

    @createController = ->
      @characterIndexController = @controller('CharacterIndexController',
        '$scope': @scope
        '$state': @state
        '$stateParams': @stateParams
        'CharacterService': @CharacterService
      )

      @digest()

  describe 'with a page set in the query', ->
    beforeEach ->
      @stateParams.page = 2
      @createController()

    it 'should set the correct page', ->
      expect(@scope.filters.page).toEqual(2)

  describe 'without query params', ->
    beforeEach ->
      @createController()

    it 'should default to page 1', ->
      expect(@scope.filters.page).toEqual(1)

    it 'should default to 10 characters per page', ->
      expect(@scope.filters.perPage).toEqual(10)

    it 'should call query on construction', ->
      expect(@CharacterService.query).toHaveBeenCalledWith(@scope.filters,
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

      it 'should call $state.go', ->
        expect(@state.go).toHaveBeenCalledWith('characters', {
          page: 2
          perPage: 10
        })

      # it 'should call query', ->
      #   expect(@CharacterService.query).toHaveBeenCalledWith(@scope.filters,
      #     jasmine.any(Function))

      # it 'should set the characters', ->
      #   expect(@scope.characters).toEqualData(@CharacterService.data.characters)

      # it 'should set the total characters', ->
      #   expect(@scope.totalCharacters).toEqualData(@CharacterService.data.total)

      # it 'should set the current page', ->
      #   expect(@scope.filters.page).toEqual(2)

'use strict'

describe 'the character types singleton', ->
  beforeEach ->
    @injectCommon()

    @fixtures = fixture.load(
      'character_types.json'
      true
    )

    @expected = @fixtures[0]
    @http.expectGET('/character_types.json').respond(@expected)

    inject (CharacterTypes)->
      @CharacterTypes = CharacterTypes

    @http.flush()

  it 'should set the character types singleton', ->
    @digest()
    expect(@CharacterTypes).toEqualData(@expected)

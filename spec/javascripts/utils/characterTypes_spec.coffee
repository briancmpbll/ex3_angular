describe 'the character types singleton', ->
  beforeEach ->
    @injectCommon()

    @expected =
      '1':
        name: 'CharacterType1'
        castes:
          '1': 'Caste1'
    @http.expectGET('/character_types.json').respond(@expected)

    inject (CharacterTypes)->
      @CharacterTypes = CharacterTypes

    @http.flush()

  it 'should set the character types singleton', ->
    @digest()
    expect(@CharacterTypes).toEqualData(@expected)

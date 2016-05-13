fixture.preload(
  'character_types.json',
  'castes.json'
)

describe 'the castes singleton', ->
  beforeEach ->
    @fixtures = fixture.load(
      'character_types.json'
      'castes.json'
      true
    )

    module ($provide)=>
      $provide.factory('CharacterTypes', =>
        @fixtures[0]
      )
      return

    @injectCommon()

    @expected = @fixtures[1]

    inject (CharacterTypes, Castes)->
      @CharacterTypes = CharacterTypes
      @Castes = Castes

  it 'should set the castes singleton', ->
    expect(@Castes).toEqualData(@expected)

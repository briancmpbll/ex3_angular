'use strict'

describe 'the castes singleton', ->
  beforeEach ->
    @injectCommon()

    @fixtures = fixture.load(
      'castes.json'
      true
    )

    @expected = @fixtures[0]
    @http.expectGET('/castes.json').respond(@expected)

    inject (Castes)->
      @Castes = Castes

    @http.flush()

  it 'should set the castes singleton', ->
    @digest()
    expect(@Castes).toEqualData(@expected)

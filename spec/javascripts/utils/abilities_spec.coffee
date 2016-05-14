'use strict'

describe 'the abilities singleton', ->
  beforeEach ->
    @injectCommon()

    @expected =
      '1': 'Ability1'
    @http.expectGET('/abilities.json').respond(@expected)

    inject (Abilities)->
      @Abilities = Abilities

    @http.flush()

  it 'should set the abilities singleton', ->
    @digest()
    expect(@Abilities).toEqualData(@expected)

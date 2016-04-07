'use strict'

describe 'the traitControl directive', ->
  beforeEach ->
    @injectCommon()

    @scope.max = 10
    @scope.trait = 5
    @scope.readOnly = true

    @directiveElem = @getCompiledElement('trait-control',
      'max="max" read-only="readOnly" trait="trait"')

    @innerScope = @directiveElem.isolateScope()

  it 'should set the inner scope max', ->
    expect(@innerScope.max).toEqualData(10)

  it 'should set the inner scope trait', ->
    expect(@innerScope.trait).toEqualData(5)

  it 'should set the inner scope readOnly', ->
    expect(@innerScope.readOnly).toEqualData(true)

  it 'should create one child', ->
    expect(@directiveElem.children().length).toEqualData(1)

  describe 'the child element', ->
    beforeEach ->
      @childElem = @directiveElem.children().first()

    it 'should be a span', ->
      expect(@childElem.prop('tagName')).toEqual('SPAN')

    it 'should have float-right class', ->
      expect(@childElem).toHaveClass('float-right')

    it 'should set the state-on attr', ->
      expect(@childElem.attr('state-on')).toEqual("'fa fa-circle'")

    it 'should set the state-off attr', ->
      expect(@childElem.attr('state-off')).toEqual("'fa fa-circle-o'")

    it 'should bind the ng-model attr', ->
      expect(@childElem.attr('ng-model')).toEqual('trait')

    it 'should bind the max attr', ->
      expect(@childElem.attr('max')).toEqual('max')

    it 'should bind the read-only attr', ->
      expect(@childElem.attr('read-only')).toEqual('readOnly')

  describe 'when the outer scope changes', ->
    beforeEach ->
      @scope.max = 15
      @scope.trait = 8
      @scope.readOnly = false

      @digest()

    it 'should change the inner scope max', ->
      expect(@innerScope.max).toEqualData(15)

    it 'should change the inner scope trait', ->
      expect(@innerScope.trait).toEqualData(8)

    it 'should change the inner scope readOnly', ->
      expect(@innerScope.readOnly).toEqualData(false)

  describe 'when the inner scope changes', ->
    beforeEach ->
      @innerScope.max = 13
      @innerScope.trait = 2
      @innerScope.readOnly = false

      @digest()

    it 'should change the outer scope max', ->
      expect(@scope.max).toEqualData(13)

    it 'should change the outer scope trait', ->
      expect(@scope.trait).toEqualData(2)

    it 'should change the outer scope readOnly', ->
      expect(@scope.readOnly).toEqualData(false)

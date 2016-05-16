'use strict'

describe 'the traitControl directive', ->
  scopeVariableTest = ()->
    it 'should match the scope variables', ->
      expect(@innerScope.traitName).toEqualData(@scope.traitName)
      expect(@innerScope.max).toEqualData(@scope.max)
      expect(@innerScope.trait).toEqualData(@scope.trait)
      expect(@innerScope.readOnly).toEqualData(@scope.readOnly)
      expect(@innerScope.selectable).toEqualData(@scope.selectable)

  commonTests = ()->
    it 'should create two children', ->
      expect(@directiveElem.children().length).toEqualData(2)

    scopeVariableTest()

    describe 'the rating element', ->
      beforeEach ->
        @ratingElem = @directiveElem.find('> span.rating-control')

      it 'should have float-right class', ->
        expect(@ratingElem).toHaveClass('float-right')

      it 'should set the state-on attr', ->
        expect(@ratingElem.attr('state-on')).toEqual("'fa fa-circle'")

      it 'should set the state-off attr', ->
        expect(@ratingElem.attr('state-off')).toEqual("'fa fa-circle-o'")

      it 'should bind the ng-model attr', ->
        expect(@ratingElem.attr('ng-model')).toEqual('trait')

      it 'should bind the max attr', ->
        expect(@ratingElem.attr('max')).toEqual('max')

      it 'should bind the read-only attr', ->
        expect(@ratingElem.attr('read-only')).toEqual('readOnly')

    describe 'when the outer scope changes', ->
      beforeEach ->
        @scope.max = 15
        @scope.trait = 8
        @scope.readOnly = false

        @digest()

      scopeVariableTest()

    describe 'when the inner scope changes', ->
      beforeEach ->
        @innerScope.max = 13
        @innerScope.trait = 2
        @innerScope.readOnly = false

        @digest()

      scopeVariableTest()

  beforeEach ->
    @injectCommon()

    @scope.traitName = 'Trait'
    @scope.max = 10
    @scope.trait = 5
    @scope.readOnly = true

    @createDirective = ()->
      @directiveElem = @getCompiledElement('trait-control',
        'trait-name="traitName" max="max" read-only="readOnly" trait="trait"
        selectable="selectable"')

      @innerScope = @directiveElem.isolateScope()

  describe 'an unselectable traitControl', ->
    beforeEach ->
      @scope.selectable = false
      @createDirective()

    commonTests()

    describe 'the label element', ->
      beforeEach ->
        @labelElem = @directiveElem.find('> span:first-child')

      it 'should show the trait name', ->
        expect(@labelElem).toHaveText('Trait')

  describe 'a selectable traitControl', ->
    beforeEach ->
      @scope.selectable = true
      @createDirective()

    commonTests()

    describe 'the checkbox div', ->
      beforeEach ->
        @checkboxDiv = @directiveElem.find('> .checkbox.checkbox-inline')

      describe 'the checkbox element', ->
        beforeEach ->
          @checkboxElem = @checkboxDiv.find('input[type="checkbox"]')

        it 'should have the right id', ->
          expect(@checkboxElem).toHaveAttr('id', 'Trait-checkbox')

      describe 'the label', ->
        beforeEach ->
          @labelElem = @checkboxDiv.find('label')

        it 'should be for the checkbox', ->
          expect(@labelElem).toHaveAttr('for', 'Trait-checkbox')

        it 'should show the trait name', ->
          expect(@labelElem).toHaveText('Trait')

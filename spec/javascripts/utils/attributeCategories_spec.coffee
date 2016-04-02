describe 'the attribute categories singleton', ->
  beforeEach ->
    @injectCommon()

    @expected =
      '1':
        name: 'Category'
        attributes: ['Attribute1', 'Attribute2']
    @http.expectGET('/attribute_categories.json').respond(@expected)

    inject (AttributeCategories)->
      @AttributeCategories = AttributeCategories

    @http.flush()

  it 'should set the attribute categories singleton', ->
    @digest()
    expect(@AttributeCategories).toEqualData(@expected)

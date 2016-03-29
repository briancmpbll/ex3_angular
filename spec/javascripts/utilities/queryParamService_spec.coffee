'use strict'

describe 'the QueryParamService', ->
  beforeEach ->
    @injectCommon
    inject ($location, QueryParamService)->
      @location = $location
      spyOn(@location, 'search').and.callThrough()

      @QueryParamService = QueryParamService

      @params =
        foo: ''
        bar: 'foobar'

  describe 'getQueryParams', ->
    beforeEach ->
      @location.url('/test?foo=bar&baz=xoxo')
      @location.search.calls.reset()
      @QueryParamService.getQueryParams(@params)

    it 'should call location.search', ->
      expect(@location.search).toHaveBeenCalled()

    it 'should set a specified param', ->
      expect(@params.foo).toEqual('bar')

    it 'should not set an unspecified param', ->
      expect(@params.baz).not.toBeDefined()

    it 'should not change a specified param that is not in the query string', ->
      expect(@params.bar).toEqual('foobar')

  describe 'setQueryParams', ->
    beforeEach ->
      @QueryParamService.setQueryParams(@params)

    it 'should call location.search', ->
      expect(@location.search).toHaveBeenCalledWith(@params)

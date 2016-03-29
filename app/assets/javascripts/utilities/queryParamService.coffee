'use strict'

app = angular.module('ex3-gen')

app.factory('QueryParamService', [
  '$location',
  ($location)->
    service = {}

    service.getQueryParams = (params)->
      queryParams = $location.search()
      for param of params
        params[param] = queryParams[param] if param of queryParams
      params

    service.setQueryParams = (params)->
      $location.search(params)

    service
])

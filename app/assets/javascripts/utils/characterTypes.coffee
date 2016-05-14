'use strict'

app = angular.module('ex3-gen')

app.factory('CharacterTypes', [
  '$resource'
  ($resource)->
    resource = $resource('/character_types.json', {},
      query: {method: 'GET', isArray: false}
    )

    types = resource.query()
])

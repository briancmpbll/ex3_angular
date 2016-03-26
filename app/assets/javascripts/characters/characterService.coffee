'use strict'

app = angular.module('ex3-gen')

app.factory('CharacterService', [
  '$resource',
  ($resource)->
    $resource('/characters/:id.json')
])

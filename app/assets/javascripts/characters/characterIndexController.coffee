'use strict'

app = angular.module('ex3-gen')

app.controller('CharacterIndexController', [
  '$scope',
  'CharacterService'
  ($scope, CharacterService)->
    $scope.characters = CharacterService.query()
])

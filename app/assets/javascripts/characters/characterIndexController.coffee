'use strict'

app = angular.module('ex3-gen')

app.controller('CharacterIndexController', [
  '$scope',
  'CharacterService'
  ($scope, CharacterService)->
    getCharacters = ->
      CharacterService.query((results)->
        $scope.characters = results.characters
        $scope.total = results.total
      )

    $scope.characters = []
    $scope.total = 0

    getCharacters()
])

app = angular.module('ex3-gen')

app.factory('CharacterService', [
  '$resource',
  ($resource)->
    $resource('/characters/:id.json')
])

app.controller('CharactersController', [
  '$scope',
  'CharacterService'
  ($scope, CharacterService)->
    $scope.characters = CharacterService.query()
])

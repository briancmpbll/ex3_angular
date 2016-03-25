app = angular.module('ex3-gen')

app.controller('CharactersController', [
  '$scope',
  'CharacterService'
  ($scope, CharacterService)->
    $scope.characters = CharacterService.query()
])

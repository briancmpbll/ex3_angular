app = angular.module('ex3-gen')

app.controller('CharacterDetailController', [
  '$scope'
  '$stateParams'
  'CharacterService'
  'AttributeCategories'
  'Abilities'
  'CharacterTypes'
  ($scope, $stateParams, CharacterService, AttributeCategories, Abilities,
  CharacterTypes)->
    $scope.attributeCategories = AttributeCategories
    $scope.abilities = Abilities
    $scope.characterTypes = CharacterTypes

    id = $stateParams.id
    $scope.character = {}
    CharacterService.get({id: id}, (data)->
      $scope.character = data
    )
])

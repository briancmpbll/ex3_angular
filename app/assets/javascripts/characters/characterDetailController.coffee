app = angular.module('ex3-gen')

app.controller('CharacterDetailController', [
  '$scope'
  '$stateParams'
  'CharacterService'
  'AttributeCategories'
  'Abilities'
  ($scope, $stateParams, CharacterService, AttributeCategories, Abilities)->
    $scope.attributeCategories = AttributeCategories
    $scope.abilities = Abilities

    id = $stateParams.id
    $scope.character = {}
    CharacterService.get({id: id}, (data)->
      $scope.character = data
    )
])

app = angular.module('ex3-gen')

app.controller('CharacterDetailController', [
  '$scope'
  'character'
  'attributeCategories'
  'abilities'
  'castes'
  ($scope, character, attributeCategories, abilities, castes)->
    $scope.attributeCategories = attributeCategories
    $scope.abilities = abilities
    $scope.castes = castes
    $scope.character = character
])

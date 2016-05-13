app = angular.module('ex3-gen')

app.controller('CharacterDetailController', [
  '$scope'
  'character'
  'attributeCategories'
  'abilities'
  ($scope, character, attributeCategories, abilities)->
    $scope.attributeCategories = attributeCategories
    $scope.abilities = abilities
    $scope.character = character
])

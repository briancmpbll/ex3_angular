'use strict'

app = angular.module('ex3-gen')

app.directive 'abilityPanel', ->
  restrict: 'E'
  templateUrl: 'characters/_ability-panel.html'
  scope:
    abilities: '='
    character: '='
    castes: '='
  controller: ['$scope',
    ($scope)->
      $scope.isCasteAbility = (abilityId)->
        abilityId = parseInt(abilityId, 10)
        caste = $scope.castes[$scope.character.caste]
        abilityId in caste.abilities
  ]

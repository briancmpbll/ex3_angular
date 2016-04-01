app = angular.module('ex3-gen')

app.directive 'abilityPanel', ->
  restrict: 'E'
  templateUrl: 'characters/_ability_panel.html'
  scope:
    abilities: '='
    character: '='
    class: '='

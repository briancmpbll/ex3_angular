app = angular.module('ex3-gen')

app.directive 'conceptPanel', ->
  restrict: 'E'
  templateUrl: 'characters/_concept-panel.html'
  scope:
    character: '='

app = angular.module('ex3-gen')

app.directive 'traitControl', ->
  restrict: 'E'
  templateUrl: 'characters/_trait-control.html'
  scope:
    max: '='
    trait: '='
    readOnly: '='
'use strict'

app = angular.module('ex3-gen')

app.directive 'traitControl', ->
  restrict: 'E'
  templateUrl: 'characters/_trait-control.html'
  scope:
    traitName: '='
    max: '='
    trait: '='
    readOnly: '='
    selectable: '='

'use strict'

app = angular.module('ex3-gen')

app.directive 'attributePanel', ->
  restrict: 'E'
  templateUrl: 'characters/_attribute-panel.html'
  scope:
    categories: '='
    character: '='

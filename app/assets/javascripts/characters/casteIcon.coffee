'use strict'

app = angular.module('ex3-gen')

app.directive 'casteIcon', ->
  restrict: 'E'
  templateUrl: 'characters/_caste-icon.html'
  scope:
    caste: '='

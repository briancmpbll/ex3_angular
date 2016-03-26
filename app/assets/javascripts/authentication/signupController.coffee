'use strict'

app = angular.module 'ex3-gen'

app.controller 'SignupController', [
  '$scope',
  'UserService'
  ($scope, UserService)->
    $scope.user =
      email: ''
      username: ''
      password: ''
      password_confirmation: ''

    $scope.register = ->
      UserService.register($scope.user)
]

'use strict'

app = angular.module 'ex3-gen'

badCredsError = 'Invalid username/password combination.'
unknownError = 'An unknown error occurred. Please try again later or contact the
                administrator.'

app.controller 'LoginController', [
  '$scope'
  'UserService'
  ($scope, UserService)->
    $scope.user =
      email: ''
      password: ''
      remember_me: false

    $scope.login = ->
      UserService.login($scope.user)
]

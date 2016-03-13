app = angular.module('ex3-gen')

app.directive('navigationBar', ->
  restrict: 'E'
  templateUrl: 'layout/_navigation-bar.html'
  controller: ['$scope', 'UserService',
    ($scope, UserService)->
      $scope.loggedIn = UserService.loggedIn
      $scope.logout = UserService.logout
      $scope.data = UserService.data
  ]
)

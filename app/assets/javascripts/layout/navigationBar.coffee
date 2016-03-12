app = angular.module('ex3-gen')

app.directive('navigationBar', ->
  restrict: 'E'
  templateUrl: 'layout/_navigation-bar.html'
  controller: ['$scope', 'Auth',
    ($scope, Auth)->
      $scope.signedIn = Auth.isAuthenticated
      $scope.logout = Auth.logout

      Auth.currentUser().then( (user)->
        $scope.user = user
      )

      $scope.$on('devise:new-registration', (e, user)->
        $scope.user = user
      )

      $scope.$on('devise:login', (e, user)->
        $scope.user = user
      )

      $scope.$on('devise:logout', (e, user)->
        $scope.user = {}
      )
  ]
)

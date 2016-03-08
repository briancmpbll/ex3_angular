app = angular.module('ex3-gen')

app.directive('navigationBar', ->
  restrict: 'E'
  templateUrl: 'navigation/navigation-bar.html'
  controller: ['$scope', 'Auth',
    ($scope, Auth)->
      config =
        headers:
          'X-HTTP-Method-Override': 'DELETE'

      $scope.signedIn = Auth.isAuthenticated
      $scope.logout = ->
        Auth.logout(config)

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

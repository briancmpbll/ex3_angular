app = angular.module('ex3-gen')

app.controller('AuthenticationController', ['$scope', '$state', 'Auth',
  ($scope, $state, Auth)->
    $scope.login = ->
      Auth.login($scope.user).then( ->
        $state.go('index')
      )

    $scope.register = ->
      Auth.register($scope.user).then( ->
        $state.go('index')
      )
])

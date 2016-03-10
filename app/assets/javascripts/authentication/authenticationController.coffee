app = angular.module('ex3-gen')

app.controller('AuthenticationController', ['$scope', '$state', 'Auth', 'Flash'
  ($scope, $state, Auth, Flash)->
    $scope.login = ->
      Auth.login($scope.user).then(
        ( -> $state.go('index') ),
        ( (error)->
          console.log(error)
          Flash.create('danger', 'Unable to login')
        )
      )

    $scope.register = ->
      Auth.register($scope.user).then(
        (-> $state.go('index') ),
        ( (error)->
          console.log(error)
          Flash.create('danger', 'Unable to register')
        )
      )
])

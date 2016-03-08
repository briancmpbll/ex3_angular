app = angular.module('ex3-gen', [])

app.controller('TestController', ['$scope',
  ($scope)->
    $scope.test = "Hello World!"
])

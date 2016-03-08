app = angular.module('ex3-gen', [
  'ui.router'
  'templates'
  'Devise'
])

app.config(['$stateProvider', '$urlRouterProvider',
  ($stateProvider, $urlRouterProvider)->
    $stateProvider
      .state('index'
        url: '/index'
        templateUrl: 'index/_index.html'
      )

    $urlRouterProvider.otherwise('index')
])

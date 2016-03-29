'use strict'

app = angular.module 'ex3-gen', [
  'ui.router'
  'templates'
  'Devise'
  'ngFlash'
  'ngAnimate'
  'ngResource'
  'change-case'
  'angularUtils.directives.dirPagination'
]

app.config [
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider)->
    redirectIfSignedIn = ['$state', 'Auth',
      ($state, Auth)->
        Auth.currentUser().then( ->
          $state.go('index')
        )
    ]

    $stateProvider
      .state('index'
        url: '/index'
        templateUrl: 'index/_index.html'
      )
      .state('login'
        url: '/login'
        templateUrl: 'authentication/_login.html'
        controller: 'LoginController'
        onEnter: redirectIfSignedIn
      )
      .state('signup'
        url: '/signup'
        templateUrl: 'authentication/_signup.html'
        controller: 'SignupController'
        onEnter: redirectIfSignedIn
      )
      .state('characters'
        url: '/characters?page&perPage'
        templateUrl: 'characters/_index.html'
        controller: 'CharacterIndexController'
        # reloadOnSearch: false
      )
      .state('characters.detail'
        url: '/:id'
        templateUrl: 'characters/_show.html'
        controller: 'CharacterDetailController'
      )

    $urlRouterProvider.otherwise('index')
]

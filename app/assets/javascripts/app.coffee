'use strict'

app = angular.module 'ex3-gen', [
  'ui.router'
  'ui.bootstrap'
  'templates'
  'Devise'
  'ngFlash'
  'ngAnimate'
  'ngResource'
  'change-case'
]

app.config [
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider)->
    redirectIfSignedIn = ['$state', 'Auth',
      ($state, Auth)->
        $state.go('index') if Auth.isAuthenticated()
    ]

    $stateProvider
      .state('index'
        url: '/index'
        templateUrl: 'index/index.html'
      )
      .state('login'
        url: '/login'
        templateUrl: 'authentication/login.html'
        controller: 'LoginController'
        onEnter: redirectIfSignedIn
      )
      .state('signup'
        url: '/signup'
        templateUrl: 'authentication/signup.html'
        controller: 'SignupController'
        onEnter: redirectIfSignedIn
      )
      .state('characters'
        abstract: true
        url: '/characters'
        template: '<ui-view/>'
        resolve:
          castes: (Castes)->
            Castes.$promise
      )
      .state('characters.index'
        url: '?page&perPage'
        templateUrl: 'characters/index.html'
        controller: 'CharacterIndexController'
        params:
          page:
            type: 'int'
            value: 1
            squash: true
            dynamic: true
          perPage:
            type: 'int'
            value: 10
            squash: true
            dynamic: true
      )
      .state('characters.detail'
        url: '/:id'
        templateUrl: 'characters/detail.html'
        controller: 'CharacterDetailController'
        resolve:
          attributeCategories: (AttributeCategories)->
            AttributeCategories.$promise

          abilities: (Abilities)->
            Abilities.$promise

          character: (CharacterService, $stateParams)->
            id = $stateParams.id

            CharacterService.get({id: id}).$promise
      )

    $urlRouterProvider.otherwise('index')
]

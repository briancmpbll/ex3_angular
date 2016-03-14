app = angular.module 'ex3-gen', [
  'ui.router'
  'templates'
  'Devise'
  'ngFlash'
  'ngAnimate'
  'change-case'
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

    $urlRouterProvider.otherwise('index')
]

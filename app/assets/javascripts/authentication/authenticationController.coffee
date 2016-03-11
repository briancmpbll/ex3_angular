app = angular.module('ex3-gen')

badCredsError = 'Invalid username/password combination.'
unknownError = 'An unknown error occurred. Please try again later or contact the administrator.'

app.controller('AuthenticationController', [
  '$scope'
  '$state'
  '$filter'
  'Auth'
  'Flash'
  ($scope, $state, $filter, Auth, Flash)->
    formatMessages = (field, messages)->
      errors = for message in messages
        "<li>#{$filter('titleCase')(field)} #{message}</li>"
      errors.join('')

    $scope.user =
      email: ''
      username: ''
      password: ''
      password_confirmation: ''
      remember_me: false

    $scope.login = ->
      Auth.login($scope.user).then(
        ( (user)->
          Flash.create('success', "Welcome back #{user.username}!")
          $state.go('index') ),
        ( (error)->
          message = if error.status is 401 then badCredsError else unknownError

          Flash.create('danger', message)
        )
      )

    $scope.register = ->
      Auth.register($scope.user).then(
        (-> $state.go('index') ),
        ( (error)->
          errors = ''
          if error.data? and error.data.errors?
            errors = for field, messages of error.data.errors
              formatMessages(field, messages)

          message = if errors != '' then "<ul>#{errors.join(' ')}</ul>" else unknownError

          Flash.create('danger', message)
        )
      )
])

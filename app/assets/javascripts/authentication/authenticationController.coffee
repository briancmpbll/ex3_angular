app = angular.module('ex3-gen')

app.controller('AuthenticationController', [
  '$scope'
  '$state'
  '$filter'
  'Auth'
  'Flash'
  ($scope, $state, $filter, Auth, Flash)->
    formatMessages = (field, messages)->
      for message in messages
        "<ul>#{$filter('titleCase')(field)} #{message}</ul>"

    $scope.errors = []

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
          errors = ''
          if error.data? and error.data.errors?
            errors = for field, messages of error.data.errors
              formatMessages(field, messages)

          message = if errors? then "<li>#{errors.join(' ')}</li>" else
            'An unknown error occurred. Please try again later or contact the administrator.'

          Flash.create('danger', message, 0, {id: 'errorAlerts'})
        )
      )
])

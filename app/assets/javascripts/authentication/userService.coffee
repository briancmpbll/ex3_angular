app = angular.module('ex3-gen')

app.factory("UserService", [
  "$rootScope"
  "$state"
  "$filter"
  "Auth"
  "Flash"
  ($rootScope, $state, $filter, Auth, Flash)->
    badCredsError = 'Invalid username/password combination.'
    unknownError = 'An unknown error occurred. Please try again later or contact the administrator.'

    formatMessages = (field, messages)->
      errors = for message in messages
        "<li>#{$filter('titleCase')(field)} #{message}</li>"
      errors.join('')

    forward = ->
      $state.go('index')

    o =
      data:
        currentUser: {}

    o.login = (credentials)->
      Auth.login(credentials).then(
        ( (user)->
          o.data.currentUser = user
          Flash.create('success', "Welcome back #{user.username}!")
          forward()
        ),
        ( (error)->
          message = if error.status is 401 then badCredsError else unknownError

          Flash.create('danger', message)
        )
      )
    o.register = (credentials)->
      Auth.register(credentials).then(
        ( (user)->
          o.data.currentUser = user
          forward()
        ),
        ( (error)->
          errors = ''
          if error.data? and error.data.errors?
            errors = for field, messages of error.data.errors
              formatMessages(field, messages)

          message = if errors != '' then "<ul>#{errors.join(' ')}</ul>" else unknownError

          Flash.create('danger', message)
        )
      )
    o.logout = Auth.logout
    o.loggedIn = Auth.isAuthenticated

    Auth.currentUser().then( (user)->
      o.data.currentUser = user
    )

    $rootScope.$on('devise:logout', ->
      o.data.currentUser = {}
    )

    o
])

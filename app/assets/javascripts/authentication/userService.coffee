app = angular.module 'ex3-gen'

app.factory 'UserService', [
  '$state'
  'Auth'
  'Flash'
  'changeCase'
  ($state, Auth, Flash, changeCase)->
    badCredsError = 'Invalid username/password combination.'
    unknownError = 'An unknown error occurred. Please try again later or contact the administrator.'

    formatMessages = (field, messages)->
      errors = for message in messages
        "<li>#{changeCase.titleCase(field)} #{message}</li>"
      errors.join('')

    forward = ->
      $state.go('index')

    service = {}
    service.data =
      currentUser: {}

    service.login = (credentials)->
      Auth.login(credentials).then(
        ( (user)->
          service.data.currentUser = user
          Flash.create('success', "Welcome back #{user.username}!")
          forward()
        ),
        ( (error)->
          message = if error.status is 401 then badCredsError else unknownError
          Flash.create('danger', message)
        )
      )
    service.register = (credentials)->
      Auth.register(credentials).then(
        ( (user)->
          service.data.currentUser = user
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
    service.logout = ->
      Auth.logout().then(
        ( ->
          service.data.currentUser = {}
        ),
        ( (error)->
          Flash.create('danger', unknownError)
        )
      )
    service.loggedIn = Auth.isAuthenticated

    Auth.currentUser().then( (user)->
      service.data.currentUser = user
    )

    service
]

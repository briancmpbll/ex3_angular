app = angular.module('ex3-gen')

app.factory('Castes', [
  '$resource'
  ($resource)->
    resource = $resource('/castes.json', {},
      query: {method: 'GET', isArray: false}
    )

    castes = resource.query()
])

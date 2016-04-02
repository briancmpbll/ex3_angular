app = angular.module('ex3-gen')

app.factory('Abilities', [
  '$resource'
  ($resource)->
    resource = $resource('/abilities.json', {}
      query: {method: 'GET', isArray: false}
    )

    abilities = resource.query()
])

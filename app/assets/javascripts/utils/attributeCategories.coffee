'use strict'

app = angular.module('ex3-gen')

app.factory('AttributeCategories', [
  '$resource',
  ($resource)->
    resource = $resource('/attribute_categories.json', {},
      query: {method: 'GET', isArray: false}
    )

    categories = resource.query()
])

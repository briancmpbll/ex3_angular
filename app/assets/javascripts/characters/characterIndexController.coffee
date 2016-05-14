'use strict'

app = angular.module('ex3-gen')

app.controller('CharacterIndexController', [
  '$scope'
  '$state'
  '$stateParams'
  'castes'
  'CharacterService'
  ($scope, $state, $stateParams, castes, CharacterService)->
    getCharacters = ->
      CharacterService.query($scope.filters, (results)->
        $scope.characters = results.characters
        $scope.totalCharacters = results.total
      )

    @uiOnParamsChanged = (newParams)->
      for param, value of newParams
        $scope.filters[param] = value if $scope.filters[param]?
      getCharacters()

    $scope.pageChanged = ->
      $state.go('.', $scope.filters)

    $scope.castes = castes

    $scope.characters = []
    $scope.totalCharacters = 0

    $scope.filters =
      page: $stateParams.page ? 1
      perPage: $stateParams.perPage ? 10

    getCharacters()

    return
])

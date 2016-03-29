'use strict'

app = angular.module('ex3-gen')

app.controller('CharacterIndexController', [
  '$scope'
  '$state'
  '$stateParams'
  'CharacterService'
  ($scope, $state, $stateParams, CharacterService)->
    getCharacters = ->
      CharacterService.query($scope.filters, (results)->
        $scope.characters = results.characters
        $scope.totalCharacters = results.total
      )

    $scope.changePage = (page)->
      $scope.filters.page = 2
      $state.go('characters', $scope.filters)

    $scope.characters = []
    $scope.totalCharacters = 0

    $scope.filters =
      page: $stateParams.page ? 1
      perPage: $stateParams.perPage ? 10

    getCharacters()
])

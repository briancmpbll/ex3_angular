'use strict'

app = angular.module('ex3-gen')

app.controller('CharacterIndexController', [
  '$scope',
  'CharacterService'
  ($scope, CharacterService)->
    getCharacters = (page)->
      CharacterService.query({page: page}, (results)->
        $scope.characters = results.characters
        $scope.totalCharacters = results.total
        $scope.currentPage = page
      )

    $scope.characters = []
    $scope.totalCharacters = 0
    $scope.currentPage = 0
    $scope.charactersPerPage = 10

    $scope.changePage = (page)->
      getCharacters(page)

    getCharacters(1)
])

'use strict'

app = angular.module('ex3-gen')

app.controller('CharacterIndexController', [
  '$scope',
  'CharacterService'
  '$location'
  ($scope, CharacterService, $location)->
    getCharacters = (page)->
      CharacterService.query({page: page}, (results)->
        $scope.characters = results.characters
        $scope.totalCharacters = results.total
        $scope.currentPage = page
        $location.search('page', page)
      )

    search = $location.search()

    $scope.characters = []
    $scope.totalCharacters = 0
    $scope.currentPage = if search? and search.page? then search.page else 1
    $scope.charactersPerPage = 10

    $scope.changePage = (page)->
      getCharacters(page)

    getCharacters($scope.currentPage)
])

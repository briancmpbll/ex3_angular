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
        $location.search('page', page)
      )

    getQueryParams = ->
      search = $location.search()
      $scope.currentPage = if search? and search.page? then search.page else 1
      getCharacters($scope.currentPage)

    $scope.characters = []
    $scope.totalCharacters = 0
    $scope.charactersPerPage = 10

    $scope.changePage = (page)->
      $location.search('page', page)

    $scope.$on('$locationChangeSuccess', getQueryParams)

    getQueryParams()
])

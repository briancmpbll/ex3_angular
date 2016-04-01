app = angular.module('ex3-gen')

app.controller('CharacterDetailController', [
  '$scope'
  '$stateParams'
  'CharacterService'
  ($scope, $stateParams, CharacterService)->
    $scope.attributeCategories = [
      {id: 1, name: 'Physical', attributes: [
        {id: 1, name: 'Strength'}
        {id: 2, name: 'Dexterity'}
        {id: 3, name: 'Stamina'}
      ]}
      {id: 2, name: 'Social', attributes: [
        {id: 4, name: 'Charima'}
        {id: 5, name: 'Manipulation'}
        {id: 6, name: 'Appearance'}
      ]}
      {id: 3, name: 'Mental', attributes: [
        {id: 7, name: 'Perception'}
        {id: 8, name: 'Intelligence'}
        {id: 9, name: 'Wits'}
      ]}
    ]

    $scope.abilities = [
      {id: 1, name: 'Archery'}
      {id: 2, name: 'Athletics'}
      {id: 3, name: 'Awareness'}
      {id: 4, name: 'Brawl'}
      {id: 5, name: 'Bureaucracy'}
    ]

    id = $stateParams.id
    $scope.character = {}
    CharacterService.get({id: id}, (data)->
      $scope.character = data
    )
])

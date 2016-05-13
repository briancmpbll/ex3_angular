app = angular.module('ex3-gen')

app.factory('Castes', [
  'CharacterTypes'
  (CharacterTypes)->
    castes = {}

    for typeId, type of CharacterTypes
      for casteId, caste of type.castes
        castes[casteId] = caste

    castes
])

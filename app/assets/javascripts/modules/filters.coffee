app = angular.module('ex3-gen')

app.filter('titleCase', ()->
  (input = '')->
    input.toString().toLowerCase().replace(/\b([a-z])/g, (ch)->
      ch.toUpperCase()
    )
)

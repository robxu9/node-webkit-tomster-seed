App.ApplicationController = Ember.Controller.extend
  currentPathChanged: Ember.observer 'currentPath', ->
    App.currentPath = @currentPath
  one: 1
  onePlusOneStatic: 1 + 1
  onePlusOneComputed: Ember.computed 'one', ->
    one = @get('one')
    one + one


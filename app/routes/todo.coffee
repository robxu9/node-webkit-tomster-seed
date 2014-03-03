App.TodoRoute = Ember.Route.extend
  model: ->
    # TODO: Integrate with Ember Data and Mozilla LocalForage
    [
      { title: 'Learn Ember.js', done: true }
      { title: 'Make desktop app', done: false }
    ]
    .map (obj) -> Ember.Object.create obj


App.TodoController = Ember.ArrayController.extend
  newTodo: ''
  remaining: Ember.computed 'content.@each.done', ->
    todos = @get 'content'
    todos.filterBy('done', false).get 'length'
  archiveCompleted: ->
    todos = @get 'content'
    todos.filterBy('done', true).forEach (todo) ->
      todos.removeObject todo
  createTodo: (title) ->
    todos = @get 'content'
    todos.pushObject Ember.Object.create(done: false, title: title)
  actions:
    archive: -> @archiveCompleted()
    create: ->
      @createTodo @get('newTodo')
      @set 'newTodo', ''


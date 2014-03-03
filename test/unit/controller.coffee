'use strict'

module 'application controller',
  setup: ->
    App.reset()
    @controller = App.ApplicationController.create()

test 'should know one plus one', ->
  equal @controller.get('onePlusOneStatic'), 2

test 'should obey the uniform access principle', ->
  equal @controller.get('onePlusOneComputed'), 2

module 'todo controller',
  setup: ->
    App.reset()
    @controller = App.TodoController.create()
    @controller.set 'content', [
      { title: 'Test Content One', done: true },
      { title: 'Second Test Content', done: false }
    ]

test 'should start with a blank new todo', ->
  expect 1
  equal @controller.get('newTodo'), ''

test 'should archive todos marked done with a method call', ->
  expect 1
  @controller.send 'archive'
  equal @controller.get('length'), 1

test 'should have a remaining property of how many todos exist that are not done', ->
  expect 1
  equal @controller.get('remaining'), 1

test 'should archive todos marked done with an action', ->
  expect 1
  @controller.archiveCompleted()
  equal @controller.get('length'), 1

test 'should create a new todo with a method call', ->
  expect 3
  title = 'Created Todo'
  @controller.createTodo title

  newTodo = @controller.get('lastObject')
  equal @controller.get('length'), 3, 'A new todo was created'
  equal newTodo.get('title'), title, 'It used the correct title'
  equal newTodo.get('done'), false, 'It was created in the not-done state'

test 'should create a new todo from the newTodo string with an action', ->
  expect 4
  title = 'Created Todo'
  @controller.set('newTodo', title)
  @controller.send 'create'

  newTodo = @controller.get('lastObject')
  equal @controller.get('length'), 3, 'A new todo was created'
  equal newTodo.get('title'), title, 'It used the correct title'
  equal newTodo.get('done'), false, 'It was created in the not-done state'
  equal @controller.get('newTodo'), '', 'It reset the newTodo property'


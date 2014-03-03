'use strict'

# http://emberjs.com/guides/testing/integration/
document.write '<div id="qunit-fixture"></div>'
App.rootElement = '#qunit-fixture'
App.setupForTesting()
App.injectTestHelpers()

module 'my app',
  setup: ->
    App.reset()
    visit('/')

test 'should automatically redirect to /todo when location hash/fragment is empty', ->
  andThen -> equal App.currentPath, 'todo'

test 'should navigate to /view1 when the View 1 link in the nav is clicked', ->
  click 'nav a:contains(View 1)'
  andThen -> equal App.currentPath, 'view1'

module 'todo',
  setup: ->
    App.reset()
    visit('/todo')

test 'should list 2 items', ->
  andThen -> equal find('.todo-item').length, 2

test 'should display checked items with a line-through', ->
  andThen -> equal find('.todo-item input:checked + span').css('text-decoration'), 'line-through'

test 'should sync done status with checkbox state', ->
  andThen -> equal find('.todo-item input:checked + span').attr('class'), 'is-done'
  andThen -> equal find('.todo-item input:not(:checked) + span').attr('class'), 'not-done'

test 'should remove checked items when the archive link is clicked', ->
  click '.archive'
  andThen -> equal find('.todo-item').length, 1

test 'should add a newly submitted item to the end of the list and empty the text input', ->
  text = 'test newly added item'
  fillIn '.new-todo', text
  click '.create'
  andThen -> equal find('.todo-item').length, 3
  andThen -> equal find('.todo-item:last span').text(), text
  andThen -> equal find('.new-todo').val(), ''

test 'should show remaining todos count', ->
  expect 2
  equal find('.todo-count').text(), '1 of 2 remaining', 'Starts right'
  fillIn '.new-todo', 'created todo'
  click '.create'
  andThen -> equal find('.todo-count').text(), '2 of 3 remaining', 'Updates total and remaining count when todo added'


module 'view1',
  setup: ->
    App.reset()
    visit('/view1')

test 'should render view1 when user navigates to view1', ->
  andThen -> notEqual find('p:first').text().match(/template for view 1/), null


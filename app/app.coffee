'use strict'

# Declare app level module which depends on filters, and services
App = Ember.Application.create
  VERSION: '0.0.1'
  # Without server side support html5 must be disabled.
  location: 'hash'

App.Router.map ->
  @route 'todo'
  @route 'view1'
  @route 'view2'

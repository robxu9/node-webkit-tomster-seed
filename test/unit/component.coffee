'use strict'

module 'app-version component',
  setup: ->
    App.reset()
    @component = App.SemVerComponent.create version: '1.2.3'

test 'should know the app version', ->
  equal @component.get('version'), '1.2.3'

test 'should know next major version', ->
  equal @component.get('nextMajorVersion'), '2.0.0'

test 'should know next minor version', ->
  equal @component.get('nextMinorVersion'), '1.3.0'

test 'should know next patch version', ->
  equal @component.get('nextPatchVersion'), '1.2.4'


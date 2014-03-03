App.SemVerComponent = Ember.Component.extend
  bumpVersionPart: (part, version) ->
    funcs = [1..3].map (n) ->
      func = ((x) -> x) if part > n
      func = ((x) -> 0) if part < n
      func = ((x) -> x + 1) if part is n
      func
    version.split('.').map((n, i) -> funcs[i] parseInt(n)).join('.')
  version: App.VERSION
  nextMajorVersion: Ember.computed 'version', -> @bumpVersionPart 1, @get('version')
  nextMinorVersion: Ember.computed 'version', -> @bumpVersionPart 2, @get('version')
  nextPatchVersion: Ember.computed 'version', -> @bumpVersionPart 3, @get('version')


exports.config =
  # See docs at http://brunch.readthedocs.org/en/latest/config.html.
  conventions:
    assets:  /^app\/assets\//
    ignored: /^(app\/styles\/overrides|(.*?\/)?[_]\w*)/
  modules:
    definition: false
    wrapper: false
  paths:
    public: '_public'
  files:
    templates:
      precompile: true
      root: 'templates'
      defaultExtension: 'hbs'
      joinTo:
        'js/templates.js': /^app/
    javascripts:
      joinTo:
        'js/app.js': /^app/
        'js/vendor.js': /^(bower_components|vendor)/

    stylesheets:
      defaultExtension: 'scss'
      joinTo:
        'css/app.css': /^(app|vendor)/

  # Enable or disable minifying of result js / css files.
  minify: true

  plugins:
    sass:
      options:
        includePaths: [
          'bower_components/foundation/scss'
        ]

// Karma configuration

module.exports = function(karma) {
  karma.configure({

    // base path, that will be used to resolve files and exclude
    basePath: '../',


    frameworks: ['qunit'],
    

    // list of files / patterns to load in the browser
    files: [
        'bower_components/jquery/jquery.js',
        'bower_components/handlebars/handlebars.js',
        'bower_components/ember/ember.js',
        'app/**/*.coffee',
        'test/e2e/**/*.coffee',
        'app/templates/**/*.handlebars',
        'app/templates/**/*.hbs',
        '_public/**/*.css',
        {pattern: '_public/**/*.js', included: false}
    ],


    // test results reporter to use
    // possible values: 'dots', 'progress', 'junit', 'growl', 'coverage'
    reporters: ['dots'],


    // web server port
    port: 9876,


    // cli runner port
    runnerPort: 9100,


    // enable / disable colors in the output (reporters and logs)
    colors: true,


    // level of logging
    // possible values: karma.LOG_DISABLE || karma.LOG_ERROR || karma.LOG_WARN || karma.LOG_INFO || karma.LOG_DEBUG
    logLevel: karma.LOG_INFO,


    urlRoot: '/__karma/',


    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: true,


    // Start these browsers, currently available:
    // - Chrome
    // - ChromeCanary
    // - Firefox
    // - Opera
    // - Safari (only Mac)
    // - PhantomJS
    // - IE (only Windows)
    browsers: ['PhantomJS'],


    // If browser does not capture in given timeout [ms], kill it
    captureTimeout: 60000,


    // Plugins to load
    plugins: [
        'karma-qunit',
        'karma-chrome-launcher',
        'karma-coffee-preprocessor',
        'karma-ember-preprocessor',
        'karma-phantomjs-launcher'
    ],


    preprocessors: {
        '**/*.coffee': 'coffee',
        '**/*.handlebars': 'ember',
        '**/*.hbs': 'ember'
    },


    proxies: {
      '/': 'http://localhost:3333/'
    },

    // Continuous Integration mode
    // if true, it capture browsers, run tests and exit
    singleRun: false
  });
};

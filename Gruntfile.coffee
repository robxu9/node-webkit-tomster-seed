module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('_public/package.json'),
    nodewebkit:
      options:
        version: "0.12.0-alpha2",
        build_dir: './dist',
        # specifiy what to build
        mac: true,
        win: true,
        linux32: true,
        linux64: true
      src: './_public/**/*'

  grunt.loadNpmTasks('grunt-node-webkit-builder')

  grunt.registerTask('default', ['nodewebkit'])

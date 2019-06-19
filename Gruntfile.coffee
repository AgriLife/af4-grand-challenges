module.exports = (grunt) ->
	@initConfig
		pkg : @file.readJSON('package.json')
		watch:
			files: ['**/**.coffee']
			tasks: ['default']
		coffee :
			compile:
				expand: true
				flatten: true
				cwd: 'js/src/'
				src: ['*.coffee']
				dest: 'js/'
				ext: '.js'
	@loadNpmTasks 'grunt-contrib-coffee'
	@loadNpmTasks 'grunt-contrib-watch'

	@registerTask 'default', ['coffee']

	@event.on 'watch', (action, filepath) =>
		@log.writeln('File changed')

module.exports = (grunt) ->
	@initConfig
		pkg : @file.readJSON('package.json')
		watch:
			files: ['css/src/*.scss', '**/**.coffee']
			tasks: ['default']
		coffee :
			compile:
				expand: true
				flatten: true
				cwd: 'js/src/'
				src: ['*.coffee']
				dest: 'js/'
				ext: '.js'
		sass:
			pkg:
				options:
					sourcemap: 'none'
					style: 'compressed'
					precision: 2
				files:
					'css/grand-challenges.css': 'css/src/grand-challenges.scss'
			dev:
				options:
					style: 'expanded'
					precision: 2
				files:
					'css/grand-challenges.css': 'css/src/grand-challenges.scss'
		sasslint:
			options:
				configFile: '.sass-lint.yml'
			target: ['css/**/*.s+(a|c)ss']
	@loadNpmTasks 'grunt-contrib-coffee'
	@loadNpmTasks 'grunt-contrib-watch'
	@loadNpmTasks 'grunt-contrib-sass'
	@loadNpmTasks 'grunt-sass-lint'

	@registerTask 'default', ['coffee', 'sass:pkg']
	@registerTask 'develop', ['coffee', 'sass:dev']

	@event.on 'watch', (action, filepath) =>
		@log.writeln('File changed')

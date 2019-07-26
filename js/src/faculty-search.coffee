$ = jQuery
AgriLife = {} if not AgriLife

AgriLife.People = class People

	lastTerm: ''

	updateSpecs: (data) ->
		$('#s').autocomplete 'option', 'source', data

	get: ->
		$.ajax(
			url: url.ajax
			data:
				action: 'get_people'
			success: (response) =>
				prefix = 'agrilife-people-' + @level
				response = JSON.parse response
				@people = response.people
				@specializations = response.specializations
				@departments = response.departments

				if $('#s').data 'ui-autocomplete'
					@update
				else
					@init

				localStorage.setItem prefix + '-faculty', JSON.stringify response.people
				localStorage.setItem prefix + '-specializations', JSON.stringify response.specializations
				localStorage.setItem prefix + '-departments', JSON.stringify response.departments
		)

	update: ->
		$('#s').autocomplete 'option', 'source', @specializations
		@filter @getTerm()

	init: ->
		@filter @getTerm()
		$('#s').autocomplete source: @specializations

	tryInitLocalStorage: ->
		prefix = 'agrilife-people-' + @level
		faculty = localStorage.getItem prefix + '-faculty'
		departments = localStorage.getItem prefix + '-departments'
		specializations = localStorage.getItem prefix + '-specializations'

		if faculty isnt 'false' and
		faculty isnt 'null' and
		departments isnt 'null' and
		specializations isnt 'null'
			@people = JSON.parse faculty
			@specializations = JSON.parse specializations
			@departments = JSON.parse departments
			@init()

	filter: (term) ->
		@lastTerm = term
		$('#people-listing-ul').html ''
		filtered = _.filter(@people, (person) =>
			termID = @specializations.indexOf term
			_.contains person.s, termID
		)
		_.each(filtered, (person) =>
			template = $('script#people-template').html()
			saveSettings = _.templateSettings
			_.templateSettings =
				evaluate : /\{\{(.+?)\}\}/g
				interpolate : /\{\{=(.+?)\}\}/g
			compiled = _.template template
			_.templateSettings = saveSettings
			person.d = @departments[person.d]
			person.t = person.t.replace /\$P/g, 'Professor'
				.replace /\$A/g, 'Associate'
				.replace /\$E/g, 'Extension'
				.replace /\$S/g, 'Specialist'
				.replace /\$M/g, 'Management'
				.replace /\$H/g, 'Department Head'
			person.e = person.e.replace /\$AT/g, '@ag.tamu.edu'
				.replace /\$T/g, '@tamu.edu'
			output = compiled {person:person}
			$('#people-listing-ul').append output
		)

	getTerm: () ->
		url = document.URL.split('=')[1]
		if url? then url.replace(/%20| /g, ' ') else url

	submit: (e) ->
		e.preventDefault()
		query = $('input[name="p"]').val()
		# Capitalize all words
		splitStr = query.toLowerCase().split ' '
		i = 0
		while i < splitStr.length
			splitStr[i] = splitStr[i].charAt 0
				.toUpperCase() + splitStr[i].substring 1
			i++
		query = splitStr.join ' '

		if @lastTerm isnt query
			if history.pushState
				# Update results without reloading
				@filter query
				newurl = window.location.protocol + "//" + window.location.host + window.location.pathname + '?query=' + query
				window.history.pushState({path:newurl},'',newurl)
			else
				# Redirect page
				resultPage = $(this).attr 'action'
				window.location.href = resultPage + '/?query=' + query

do ( $ = jQuery ) ->
	"use strict"
	$ ->

		people = new AgriLife.People

		people.level = $('.people-searchform').data 'faculty-level'

		people.tryInitLocalStorage()

		people.get()

		$('.people-search-form .category').click (e) ->
			people.filter $(this).data 'category'

		$('.people-searchform').on 'submit', (e) ->
			people.submit e

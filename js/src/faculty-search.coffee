$ = jQuery
AgriLife = {} if not AgriLife

AgriLife.People = class People

	updateSpecs: (data) ->
		$('#s').autocomplete 'option', 'source', data

	get: ->
		$.ajax(
			url: url.ajax
			data:
				action: 'get_people'
			success: (response) =>
				response = JSON.parse response
				@people = response.people
				@specializations = response.specializations
				@departments = response.departments

				if $('#s').data 'ui-autocomplete'
					@update
				else
					@init

				localStorage.setItem 'agrilife-people-faculty', JSON.stringify response.people
				localStorage.setItem 'agrilife-people-specializations', JSON.stringify response.specializations
				localStorage.setItem 'agrilife-people-departments', JSON.stringify response.departments
		)

	update: ->
		@filter @getTerm()
		$('#s').autocomplete 'option', 'source', @specializations

	init: ->
		@filter @getTerm()
		$('#s').autocomplete source: @specializations

	tryInitLocalStorage: ->
		faculty = localStorage.getItem 'agrilife-people-faculty'
		departments = localStorage.getItem 'agrilife-people-departments'
		specializations = localStorage.getItem 'agrilife-people-specializations'

		if faculty isnt 'false' and
		faculty isnt 'null' and
		departments isnt 'null' and
		specializations isnt 'null'
			@people = JSON.parse faculty
			@specializations = JSON.parse specializations
			@departments = JSON.parse departments
			@init()

	filter: (term) ->
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

do ( $ = jQuery ) ->
	"use strict"
	$ ->

		people = new AgriLife.People

		people.tryInitLocalStorage()

		people.get()

		$('.people-search-form .category').click (e) ->
			people.filter $(this).data 'category'

		$('.people-searchform').on 'submit', (e) ->
			e.preventDefault()
			query = $('input[name="p"]').val()
			# Capitalize all words
			splitStr = query.toLowerCase().split(' ')
			i = 0
			while i < splitStr.length
				splitStr[i] = splitStr[i].charAt(0).toUpperCase() + splitStr[i].substring(1)
				i++
			query = splitStr.join ' '
			#
			resultPage = $(this).attr('action')
			window.location.href = resultPage + '/?query=' + query

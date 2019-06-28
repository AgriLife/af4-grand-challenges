$ = jQuery
AgriLife = {} if not AgriLife

AgriLife.People = class People

	get: ->
		$.ajax(
			url: url.ajax
			data:
				action: 'get_people'
			success: (response) =>
				response = JSON.parse(response)
				@filter(@getTerm())
				$('#s').autocomplete source: response.specializations
		)

	filter: (term) ->
		$('#people-listing-ul').html('')
		filtered = _.filter(@people, (person) =>
			termID = @specializations.indexOf term
			_.contains(person.sp, termID)
		)
		_.each(filtered, (person) =>
			template = $('script#people-template').html()
			saveSettings = _.templateSettings
			_.templateSettings =
				evaluate : /\{\{(.+?)\}\}/g
				interpolate : /\{\{=(.+?)\}\}/g
			compiled = _.template template
			_.templateSettings = saveSettings
			output = compiled person
			$('#people-listing-ul').append(output)
		)

	getTerm: () ->
		url = document.URL.split('=')[1]
		if url? then url.toLowerCase().replace(/%20| /g, ' ') else url


do ( $ = jQuery ) ->
	"use strict"
	$ ->

		people = new AgriLife.People
		people.get()

		$('.people-search-form .category').click (e) ->
			people.filter($(this).data('category'))

		$('.people-searchform').on 'submit', (e) ->
			e.preventDefault()
			query = $('input[name="p"]').val()
			resultPage = $(this).attr('action')
			window.location.href = resultPage + '/?query=' + query

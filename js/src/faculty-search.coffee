$ = jQuery
AgriLife = {} if not AgriLife

AgriLife.People = class People

	lastSpec: ''

	updateSpecs: (data) ->
		$('#s').autocomplete 'option', 'source', data

	get: ->
		$.ajax(
			url: url.ajax
			data:
				action: 'get_people'
			success: (response) =>
				response = JSON.parse response

				if response is undefined or ( response.people and response.people.length is 0 )
					return

				prefix = 'agrilife-people-';
				if @specialization then prefix += @specialization
				else prefix += 'all'
				@people = response.people
				@specializations = response.specializations
				@departments = response.departments

				localStorage.setItem prefix + '-faculty', JSON.stringify response.people
				localStorage.setItem prefix + '-specializations', JSON.stringify response.specializations
				localStorage.setItem prefix + '-departments', JSON.stringify response.departments

				# Decompress people attributes
				@people = @decompress @people

				if $('#s').data 'ui-autocomplete'
					@update()
				else
					@init()
		)

	tryInitLocalStorage: ->
		prefix = 'agrilife-people-' + @specialization
		faculty = localStorage.getItem prefix + '-faculty'
		departments = localStorage.getItem prefix + '-departments'
		specializations = localStorage.getItem prefix + '-specializations'

		if typeof faculty is 'string' and
		typeof departments is 'string' and
		typeof specializations is 'string'
			@people = JSON.parse faculty
			@specializations = JSON.parse specializations
			@departments = JSON.parse departments

			@people = @decompress @people

			@init()

	decompress: (people) ->
		_.each people, (person, index, list) =>
			# Department
			person.fd = @departments[person.d]
			# Specializations
			person.fs = []
			_.each person.s, (specialty) =>
				person.fs.push @specializations[specialty]
			# Title
			person.t = person.t.replace /\$P/g, 'Professor'
				.replace /\$A/g, 'Associate'
				.replace /\$E/g, 'Extension'
				.replace /\$S/g, 'Specialist'
				.replace /\$M/g, 'Management'
				.replace /\$H/g, 'Department Head'
			# Email
			person.e = person.e.replace /\$AT/g, '@ag.tamu.edu'
				.replace /\$T/g, '@tamu.edu'
			# Phone
			phone = person.p
			person.p = phone.replace /^(\d{3})\D+(\d{3})\D+(\d{4})/, '($1) $2-$3'
			person.pt = phone.replace /^(\d{3})\D+(\d{3})\D+(\d{4})/, '+1-$1-$2-$3'
			# Complete
			list[index] = person

	init: ->
		@parent = $ '.people-searchform'
		@listParent = $ '#people-listing-ul'

		@updateTermFilters @getTermsInURL()
		@render()
		@updateResults()
		$('#s').autocomplete source: @specializations
		@attachEvents()

	update: ->
		$('#s').autocomplete 'option', 'source', @specializations
		@render true
		@updateResults()

	attachEvents: ->
		people = this

		$('.people-search-form .category').click (e) ->
			vals = {spec: people.specializations.indexOf($(this).data('category'))}
			valsX = {spec: $(this).data('category')}
			people.updateTermFilters vals
			people.updateResults vals
			people.tryPushState e, valsX, people.reload

		$('.people-searchform').on 'submit', (e) ->
			people.submit e

		$('.people-search-form .clear.button').click (e) ->
			vals = {spec: -1, dept: -1, facultyname: ''}
			people.updateTermFilters vals
			people.updateResults()
			tryPushState e, vals

	setLastUsedVals: (vals) ->
		if vals is undefined
			vals = @getFiltersAsIndexes()
		@lastSpec = vals.spec
		@lastDept = vals.dept
		@lastName = vals.facultyname
		return vals

	getTermsInURL: () ->
		specregex = new RegExp '[\\?&]specialization=([^&#]*)'
		specresults = specregex.exec location.search
		spec = if specresults is null then '' else decodeURIComponent specresults[1].replace /\+/g, ' '

		deptregex = new RegExp '[\\?&]department=([^&#]*)'
		deptresults = deptregex.exec location.search
		dept = if deptresults is null then '' else decodeURIComponent deptresults[1].replace /\+/g, ' '

		nameregex = new RegExp '[\\?&]facultyname=([^&#]*)'
		nameresults = nameregex.exec location.search
		facultyname = if nameresults is null then '' else decodeURIComponent nameresults[1].replace /\+/g, ' '

		@setLastUsedVals {
			spec: @specializations.indexOf(spec),
			dept: @departments.indexOf(dept),
			facultyname: facultyname
		}

	updateTermFilters: (vals) ->
		$specfilter = @parent.find('input[name="p"]')
		$deptfilter = @parent.find('select[name="department"]')
		$namefilter = @parent.find('input[name="facultyname"]')

		if vals.spec < 0 or vals.spec is undefined
			$specfilter.val ''
		else
			spec = @specializations[vals.spec]
			$specfilter.val spec

		if vals.dept < 0 or vals.dept is undefined
			$deptfilter.val ''
		else
			$deptfilter.val vals.dept

		if vals.facultyname is undefined
			$namefilter.val ''
		else
			$namefilter.val vals.facultyname

		@setLastUsedVals vals


	getFiltersAsIndexes: ->
		vals = {}
		spec = @parent.find('input[name="p"]').val()
		dept = @parent.find('select[name="department"]').val()
		facultyname = @parent.find('input[name="facultyname"]').val()
		# Capitalize all words
		splitStr = spec.toLowerCase().split ' '
		i = 0
		while i < splitStr.length
			splitStr[i] = splitStr[i].charAt 0
				.toUpperCase() + splitStr[i].substring 1
			i++
		spec = splitStr.join ' '
		spec = @specializations.indexOf spec
		dept = if dept is '' then -1 else parseInt dept

		return {
			spec: spec,
			dept: dept,
			facultyname: facultyname
		}

	render: (refresh) ->
		$parent = $ '#people-listing-ul'
		template = $ 'script#people-template'
			.html()

		if refresh is true then $parent.html ''

		_.each(@people, (person) =>
			saveSettings = _.templateSettings
			_.templateSettings =
				evaluate : /\{\{(.+?)\}\}/g
				interpolate : /\{\{=(.+?)\}\}/g
			compiled = _.template template
			_.templateSettings = saveSettings
			output = compiled {person:person}
			$parent.append output
		)

	updateResults: (terms) ->
		$faculty = $ '.people-listing-item'
		$activeFaculty = $faculty

		if terms is undefined
			terms = @getFiltersAsIndexes()

		activeClasses = []
		if -1 isnt terms.spec and undefined isnt terms.spec then activeClasses.push '.spec-' + terms.spec
		if -1 isnt terms.dept and undefined isnt terms.dept then activeClasses.push '.dept-' + terms.dept

		if activeClasses.length is 0 and (terms.facultyname is undefined or terms.facultyname is '')
			$faculty.filter(':hidden').fadeIn()
			$faculty.removeClass('item-odd').each (i) ->
				if i%2 is 0 then $(this).addClass 'item-odd'
		else
			selected = activeClasses.join ''
			if terms.facultyname isnt undefined and terms.facultyname isnt ''
				$activeFaculty = @itemsHavingText $faculty, terms.facultyname, '.people-name'
			$activeFaculty = $activeFaculty.filter selected
			if $activeFaculty.length > 0
				# Show or hide faculty
				$activeFaculty.fadeIn().removeClass('item-odd').each (i) ->
					if i%2 is 0 then $(this).addClass 'item-odd'
				$faculty.not $activeFaculty
					.fadeOut().removeClass 'item-odd'
			else
				$('.people-listing-item').fadeOut().removeClass 'item-odd'

	itemsHavingText: ($items, text, selector) ->
		$items.filter (i) ->
				$this = $ this
				text = text.toLowerCase()
				fulltext = $this.find(selector).html().toLowerCase()
				return fulltext.indexOf(text) >= 0

	tryPushState: (e, vals, callback) ->
		if history.pushState
			# Update results without reloading
			@updateResults()
			params = []
			newurl = window.location.protocol + "//" + window.location.host + window.location.pathname
			if vals.spec then params.push 'specialization=' + vals.spec
			if vals.dept then params.push 'department=' + vals.dept
			if vals.facultyname then params.push 'facultyname=' + vals.facultyname
			if params.length > 0
				newurl += '?'
				newurl += encodeURI params.join('&')
			window.history.pushState({path:newurl},'',newurl)
		else
			callback(e, vals)

	reload: (e, vals) ->
		# Redirect page
		resultPage = $(e.target).attr 'action'
		params = []
		newurl = encodeURI resultPage
		if vals.spec then params.push 'specialization=' + vals.spec
		if vals.dept then params.push 'department=' + vals.dept
		if vals.facultyname then params.push 'facultyname=' + vals.facultyname
		if params.length > 0
			newurl += '?'
			newurl += encodeURI params.join('&')
		window.location.href = newurl

	submit: (e) ->
		e.preventDefault()
		@setLastUsedVals()
		vals = {}
		if '' isnt @lastSpec then vals.spec = @specializations[@lastSpec]
		if '' isnt @lastDept then vals.dept = @departments[@lastDept]
		if '' isnt @lastName then vals.facultyname = @lastName
		@tryPushState e, vals, @reload

do ( $ = jQuery ) ->
	"use strict"
	$ ->
		people = new AgriLife.People
		people.specialization = $('.people-searchform').data 'specialization'
		people.tryInitLocalStorage()
		people.get()

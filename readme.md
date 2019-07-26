# Faculty Search
[![Codeship Status for AgriLife/agrilife-faculty-search](https://app.codeship.com/projects/922e1dd0-75c0-0137-8850-4a74f06c083c/status?branch=master)](https://app.codeship.com/projects/349707)

## WordPress Requirements

1. Genesis theme
2. AgriFlex4 theme: [Download the latest release](https://github.com/agrilife/agriflex4/releases/latest)
3. AgriLife People API plugin: [Download the latest release](https://github.com/AgriLife/agrilife-people-api/releases/latest)
4. PHP 5.6+, tested with PHP 7.2

## Installation

1. [Download the latest release](https://github.com/agrilife/agrilife-faculty-search/releases/latest)
2. Upload the plugin to your site

## Features
Shortcodes:
1. [faculty_search_categories] Shows the faculty search form with category buttons. Optional "specialization" parameter to restrict results to a certain specialization.
2. [faculty_search] Shows the faculty search form. Optional "specialization" parameter to restrict results to a certain specialization.

## Development Installation

1. Copy this repo to the desired location.
2. In your terminal, navigate to the plugin location 'cd /path/to/the/plugin'
3. Run "npm start" to configure your local copy of the repo, install dependencies, and build files

## Development Notes

When you stage changes to this repository and initiate a commit, they must pass PHP coding standards checks before they will complete the commit step. Release tasks can only be used by the repository's owners.

## Development Tasks

1. Run "npm run checkwp" to check PHP files against WordPress coding standards.
2. Run "grunt watch" to watch changes to the JavaScript file.

## Development Requirements

* Node: http://nodejs.org/
* NPM: https://npmjs.org/


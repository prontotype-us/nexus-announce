request = require 'request'

announce = ({api_key}) -> (event) ->
    request.post {url: 'http://localhost:5010/events', json: event, headers: {'api-key': api_key}}

module.exports = announce

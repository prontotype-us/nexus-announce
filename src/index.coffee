request = require 'request'

announce = ({api_key}) -> (event) ->
    request.post {url: 'http://webhooks.nexus.prontotype.us/events', json: event, headers: {'api-key': api_key}}

module.exports = announce

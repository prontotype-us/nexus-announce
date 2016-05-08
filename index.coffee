request = require 'request'

announce = ({api_key, active}) -> (event) ->
    if active == true
        request.post {url: 'http://webhooks.nexus.prontotype.us/events', json: event, headers: {'api-key': api_key}}

module.exports = announce

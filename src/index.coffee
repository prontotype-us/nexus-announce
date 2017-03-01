request = require 'request'

announce = (config={}) ->
    {api_key, disabled} = config

    if !api_key?.length
        throw new Error "[nexus-announce] No API key"

    if disabled
        return (event) ->
            console.log "[announce] Not announcing"

    return (event) ->
        request.post {
            url: 'http://webhooks.nexus.prontotype.us/events'
            json: event
            headers: {
                'api-key': api_key
            }
        }

module.exports = announce

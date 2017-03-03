request = require 'request'

announce = (config={}) ->
    {api_key, disabled, base_url} = config
    base_url ||= 'http://webhooks.nexus.prontotype.us'

    if !api_key?.length
        throw new Error "[nexus-announce] No API key"

    if disabled
        return (event) ->
            console.log "[announce] Not announcing"

    return (event) ->
        request.post {
            url: base_url + '/events'
            json: event
            headers: {
                'api-key': api_key
            }
        }

module.exports = announce

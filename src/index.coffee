request = require 'request'

announce = (config={}) ->
    {api_key, disabled, base_url} = config
    base_url ||= 'http://webhooks.nexus.prontotype.us'

    if disabled
        return ->
            console.log "[announce] Not announcing"

    if !api_key?.length
        throw new Error "[nexus-announce] No API key"

    return (event) ->
        request.post {
            url: base_url + '/events'
            json: event
            headers: {
                'api-key': api_key
            }
        }

module.exports = announce

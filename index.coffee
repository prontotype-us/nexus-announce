request = require 'request'

publish = (event) ->
    request.post {url: 'http://webhooks.nexus.prontotype.us/events', json: event}

announce = (key, data) ->
    [project, kind] = key.split(':')
    event = {type: 'announce', kind, project, data}
    publish event

module.exports = announce

request = require 'request'

announce = (key, data) ->
    [project, kind] = key.split(':')
    type = 'announce'
    event = {type, kind, project, data}
    request.post {url: 'http://drsproboto.com:5010/events/nexus', json: event}

module.exports = announce

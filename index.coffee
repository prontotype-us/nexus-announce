request = require 'request'

announce = (key, data, type = 'announce') ->
    [project, kind] = key.split(':')
    kind |= 'unknown'
    event = {type, kind, project, data}
    request.post {url: 'http://drsproboto.com:5010/events/nexus', json: event}

module.exports = announce

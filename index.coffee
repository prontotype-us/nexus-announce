publish = require 'nexus-publish'

announce = (key, data) ->
    [project, kind] = key.split(':')
    event = {type: 'announce', kind, project, data}
    publish event

module.exports = announce

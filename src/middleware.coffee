announce = require 'nexus-announce'

# Announces as a 'page-view' or config.type whenever someone visits
# a route that does not end with a file extension

isStatic = (path) -> path.match /\.\w+$/

module.exports = (config) -> (req, res, next) ->
    if req.method.toLowerCase() == 'get' and !isStatic(req.path)
        announce(config) {
            type: config.type or 'page-visit'
            project: config.project
            environment: config.environment or 'local'
            data: {
                page: req.path[1..] || 'home'
                ip: req.headers['x-forwarded-for'] || req.connection.remoteAddress
                ua: req.get('User-Agent')
                session_id: req.session?.id
                user: res.locals.user
            }
        }

    next()


announce = require 'nexus-announce'

isStatic = (path) -> path.match /\.\w+$/

module.exports = (config) -> (project_name) -> (req, res, next) ->
    if req.method.toLowerCase() == 'get' and !isStatic(req.path)
        announce(config) {   
            project: project_name
            type: 'page-view'
            page: req.path[1..] || 'home'
            ip: req.headers['x-forwarded-for'] || req.connection.remoteAddress
            ua: req.get('User-Agent')
            session_id: req.session?.id
            user: res.locals.user
        }

    next()

announce = require 'nexus-announce'

isStatic = (path) -> path.match /\.\w+$/

module.exports = (project_name) -> (req, res, next) ->
    if req.method.toLowerCase() == 'get' and !isStatic(req.path)
        announce project_name + ':page-view',
            page: req.path[1..] || 'home'
            ip: req.headers['x-forwarded-for'] || req.connection.remoteAddress
            ua: req.get('User-Agent')

    next()

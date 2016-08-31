announce = require('nexus-announce')({api_key: 'asdf123'})

process.stdin.resume()
process.stdin.on 'data', (data) ->
    line = data.toString().trim()
    announce {type: 'message', body: line, sender: {username: 'joe'}}


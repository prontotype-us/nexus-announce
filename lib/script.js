// Generated by CoffeeScript 1.10.0
var announce;

announce = require('nexus-announce')({
  api_key: 'asdf123'
});

process.stdin.resume();

process.stdin.on('data', function(data) {
  var line;
  line = data.toString().trim();
  return announce({
    type: 'message',
    body: line,
    sender: {
      username: 'joe'
    }
  });
});

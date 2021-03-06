// Generated by CoffeeScript 1.10.0
var announce, request;

request = require('request');

announce = function(config) {
  var api_key, base_url, disabled;
  if (config == null) {
    config = {};
  }
  api_key = config.api_key, disabled = config.disabled, base_url = config.base_url;
  base_url || (base_url = 'http://webhooks.nexus.prontotype.us');
  if (disabled) {
    return function() {
      return console.log("[announce] Not announcing");
    };
  }
  if (!(api_key != null ? api_key.length : void 0)) {
    throw new Error("[nexus-announce] No API key");
  }
  return function(event) {
    return request.post({
      url: base_url + '/events',
      json: event,
      headers: {
        'api-key': api_key
      }
    });
  };
};

module.exports = announce;

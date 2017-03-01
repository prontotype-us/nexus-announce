# nexus-announce

Node.js library for sending events to the Nexus API

```
npm install nexus-announce
```

## Usage

Require `nexus-announce` and create an announce function with your API key:

```coffee
nexus_config = {api_key: "xyz..."}
announce = require('nexus-announce')(nexus_config)
```

Then use `announce` to send any valid JSON event to Nexus:

```coffee
# a wild user appears...
announce({type: 'login', username: 'joe', app: 'tryna', version: '0.0.1'})
```

## Config

* `api_key: String` **Required**
    * API Key for the Nexus account you are posting into
* `disabled: Bool`
    * Set to temporarily disable without removing calls to `announce`

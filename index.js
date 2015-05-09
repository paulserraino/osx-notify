var Notifier = require('./build/Release/addon').Notifier;

var n = new Notifier();
n._setTitle('hello world');
n._send();

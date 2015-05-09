var Notifier = require('bindings')('addon.node').Notifier;

Notifier.prototype.send = function (opts) {
	if (!opts) return;
	var k, defaults = {
		title: '',
		subtitle: '',
		informativeText: ''
	};

	for(k in defaults) {
		if (!(k in opts)) opts[k] = defaults[k];
	}

	this._setTitle(opts.title);
	this._setSubTitle(opts.subtitle);
	this._setInformativeText(opts.informativeText);
	this._send();
};

module.exports = Notifier;

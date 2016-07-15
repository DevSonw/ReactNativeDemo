'use strict';

function route(c1, c2, c3, c4,c5)
{
	var module = c1;
	var func = c2;
	var token = '', params = {};
	var callback;
	if (typeof c3 == 'function'){
		callback = c3;
	}else if (typeof c4 == 'function'){
		params = c3;
		callback = c4;
	}else if (typeof c5 == 'function'){
		token = c3;
		params = c4;
		callback = c5;
	}
	var bridge = require('react-native').NativeModules.RNBridge;
	if(callback){
		bridge.callNativeWithCallback(module,func, token||'', params||{}, callback || ((e) => null));
	}else {
		bridge.callNative(module,func, token||'', params||{});
	}
}

module.exports = {
  route,
};

#include "addon.h"

NAN_METHOD(test) {
	NanScope();
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init]; 
	AppDelegate *h= [[AppDelegate alloc] init];
	[h notify];
	[pool drain];
	NanReturnUndefined();
}

void init(v8::Handle<v8::Object> exports) {
	exports->Set(
		NanNew<v8::String>("notify")
		, NanNew<v8::FunctionTemplate>(test)->GetFunction()
	);
}

NODE_MODULE(addon, init)
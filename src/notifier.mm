#include "addon.h"

Notifier::Notifier() {

}

Notifier::~Notifier() {
	
}
NAN_METHOD(Notifier::New) {
	NanScope();
	Notifier *notifier = new Notifier();
	notifier->Wrap(args.This());
	NanReturnValue(args.This());
}

NAN_METHOD(Notifier::setTitle) {
	NanScope();
	Notifier *self = ObjectWrap::Unwrap<Notifier>(args.This());
	self->title = *NanUtf8String(args[0]);
  NanReturnUndefined();
}

NAN_METHOD(Notifier::send) {
	NanScope();
	Notifier *self = ObjectWrap::Unwrap<Notifier>(args.This());

	printf("%s\n", self->title.c_str());

	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init]; 
	AppDelegate *h= [[AppDelegate alloc] init];
	[h notify];
	[pool drain];

	NanReturnValue(self->title);
}
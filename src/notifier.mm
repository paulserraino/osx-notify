#include "addon.h"

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

NAN_METHOD(Notifier::setSubTitle) {
	NanScope();
	Notifier *self = ObjectWrap::Unwrap<Notifier>(args.This());
	self->subtitle = *NanUtf8String(args[0]);
  NanReturnUndefined();
}

NAN_METHOD(Notifier::setInformativeText) {
	NanScope();
	Notifier *self = ObjectWrap::Unwrap<Notifier>(args.This());
	self->informativeText = *NanUtf8String(args[0]);
  NanReturnUndefined();
}

NAN_METHOD(Notifier::send) {
	NanScope();
	Notifier *self = ObjectWrap::Unwrap<Notifier>(args.This());
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init]; 
	NSMutableDictionary *opts = [[NSMutableDictionary alloc] init];

	opts[@"title"] = [NSString stringWithUTF8String:self->title.c_str()];
	opts[@"subtitle"] = [NSString stringWithUTF8String:self->subtitle.c_str()];
	opts[@"informativeText"] = [NSString stringWithUTF8String:self->informativeText.c_str()];

	AppDelegate *delegate= [[AppDelegate alloc] init];

	[delegate notify:opts];

	[pool drain];

	//TODO: return a callback
  NanReturnUndefined();
}
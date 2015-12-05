#include "addon.h"

NAN_METHOD(Notifier::New) {
  Notifier *notifier = new Notifier();
  notifier->Wrap(info.This());
  info.GetReturnValue().Set(info.This());
}

NAN_METHOD(Notifier::setTitle) {
  Notifier *self = Nan::ObjectWrap::Unwrap<Notifier>(info.This());
  self->title = *Nan::Utf8String(info[0]);
}

NAN_METHOD(Notifier::setSubTitle) {
  Notifier *self = Nan::ObjectWrap::Unwrap<Notifier>(info.This());
  self->subtitle = *Nan::Utf8String(info[0]);
}

NAN_METHOD(Notifier::setInformativeText) {
  Notifier *self = Nan::ObjectWrap::Unwrap<Notifier>(info.This());
  self->informativeText = *Nan::Utf8String(info[0]);
}

NAN_METHOD(Notifier::send) {
  Notifier *self = Nan::ObjectWrap::Unwrap<Notifier>(info.This());
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  NSMutableDictionary *opts = [[NSMutableDictionary alloc] init];

  opts[@"title"] = [NSString stringWithUTF8String:self->title.c_str()];
  opts[@"subtitle"] = [NSString stringWithUTF8String:self->subtitle.c_str()];
  opts[@"informativeText"] = [NSString stringWithUTF8String:self->informativeText.c_str()];

  AppDelegate *delegate= [[AppDelegate alloc] init];

  [delegate notify:opts];

  [pool drain];

  //TODO: return a callback
}

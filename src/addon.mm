#include "addon.h"

void Init(v8::Handle<v8::Object> exports) {
  v8::Local<v8::FunctionTemplate> tpl = NanNew<v8::FunctionTemplate>(Notifier::New);

  tpl->SetClassName(NanNew("Notifier"));
  tpl->InstanceTemplate()->SetInternalFieldCount(1);

  NODE_SET_PROTOTYPE_METHOD(tpl, "_setTitle", Notifier::setTitle);
  NODE_SET_PROTOTYPE_METHOD(tpl, "_setSubTitle", Notifier::setSubTitle);
  NODE_SET_PROTOTYPE_METHOD(tpl, "_setInformativeText", Notifier::setInformativeText);
  NODE_SET_PROTOTYPE_METHOD(tpl, "_send", Notifier::send);

  exports->Set(NanNew<v8::String>("Notifier"), tpl->GetFunction());
}

NODE_MODULE(addon, Init)
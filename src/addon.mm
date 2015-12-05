#include "addon.h"

NAN_MODULE_INIT(InitAddon) {
  v8::Local<v8::FunctionTemplate> tpl = Nan::New<v8::FunctionTemplate>(Notifier::New);

  tpl->SetClassName(Nan::New("Notifier").ToLocalChecked());
  tpl->InstanceTemplate()->SetInternalFieldCount(1);

  Nan::SetPrototypeMethod(tpl, "_setTitle", Notifier::setTitle);
  Nan::SetPrototypeMethod(tpl, "_setSubTitle", Notifier::setSubTitle);
  Nan::SetPrototypeMethod(tpl, "_setInformativeText", Notifier::setInformativeText);
  Nan::SetPrototypeMethod(tpl, "_send", Notifier::send);

  Nan::Set(target,
      Nan::New("Notifier").ToLocalChecked(), Nan::GetFunction(tpl).ToLocalChecked());
}

NODE_MODULE(addon, InitAddon)

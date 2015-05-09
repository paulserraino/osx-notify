#include "addon.h"

class Notifier : public node::ObjectWrap
{
private:
	std::string title;
	std::string subtitle;
	std::string informativeText;
public:

	static NAN_METHOD(New);
	static NAN_METHOD(setTitle);
	static NAN_METHOD(setSubTitle);
	static NAN_METHOD(setInformativeText);
	static NAN_METHOD(send);
};

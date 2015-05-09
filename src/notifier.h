#include "addon.h"

class Notifier : public node::ObjectWrap
{
private:
	std::string title;
	NSAutoreleasePool * pool;
	AppDelegate *delegate;
public:
	Notifier();
	~Notifier();

	static NAN_METHOD(New);
	static NAN_METHOD(setTitle);
	static NAN_METHOD(send);
};

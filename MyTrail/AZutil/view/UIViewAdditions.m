
#import "UIViewAdditions.h"


@implementation UIView (Additions)

- (void)removeAllSubviews {
	while (self.subviews.count) {
		UIView* child = self.subviews.lastObject;
		[child removeFromSuperview];
	}
}

- (UIViewController*)viewController {
	if ([[self nextResponder] isKindOfClass:[UIViewController class]]) {
		return (UIViewController*)[self nextResponder];
	}
	
	for (UIView* next = [self superview]; next; next = next.superview) {
		UIResponder* nextResponder = [next nextResponder];
		if ([nextResponder isKindOfClass:[UIViewController class]]) {
			return (UIViewController*)nextResponder;
		}
	}
	return nil;
}
@end

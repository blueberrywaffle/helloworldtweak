#include "EGKRootListController.h"

@implementation EGKRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

- (void)github {
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/blueberrywaffle/helloworldtweak"] options:@{} completionHandler:nil];
}

- (void)twitter {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/blueberryOG"] options:@{} completionHandler:nil];
}

@end

//
//  urlencoderAppDelegate.m
//  urlencoder
//
//  Created by Sutra Zhou on 11-8-31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "urlencoderAppDelegate.h"

@implementation urlencoderAppDelegate

@synthesize window;

@synthesize textTextField;

@synthesize encodedTextField;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
}

- (IBAction)encode:(id)sender {
	NSString *unencodedString = [textTextField stringValue];
	NSString * encodedString = (NSString *)CFURLCreateStringByAddingPercentEscapes
		(NULL,
		 (CFStringRef)unencodedString,
		 NULL,
		 (CFStringRef)@"!*'();:@&=+$,/?%#[]",
		 kCFStringEncodingUTF8);
	[encodedTextField setStringValue:encodedString];
}

@end

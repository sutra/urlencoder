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
@synthesize decodedTextField;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
}

- (IBAction)encode:(id)sender {
	NSString *unencodedString = [textTextField stringValue];
	
    // encode
    NSString * encodedString = (NSString *)CFURLCreateStringByAddingPercentEscapes
		(NULL,
		 (CFStringRef)unencodedString,
		 NULL,
		 (CFStringRef)@"!*'();:@&=+$,/?%#[]",
		 kCFStringEncodingUTF8);
	[encodedTextField setStringValue:encodedString];
    
    // decode
    [decodedTextField setStringValue:[unencodedString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
}

@end

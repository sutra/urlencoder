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
@synthesize encodedTextField;
@synthesize encodeButton;
@synthesize decodeButton;
@synthesize decodedTextView;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
}

- (IBAction)decode:(id)sender {
    NSString *encodedString = [encodedTextField stringValue];
	
    // decode
    [decodedTextView setString:[encodedString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
}

- (IBAction)encode:(id)sender {
    NSString *unencodedString = [decodedTextView string];
	
    // encode
    NSString * encodedString = (NSString *)CFURLCreateStringByAddingPercentEscapes
    (NULL,
     (CFStringRef)unencodedString,
     NULL,
     (CFStringRef)@"!*'();:@&=+$,/?%#[]",
     kCFStringEncodingUTF8);
	[encodedTextField setStringValue:encodedString];
}
@end

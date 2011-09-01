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

- (void)textViewDidChangeSelection:(NSNotification *)aNotification{
    NSRange selectedRange = [decodedTextView selectedRange];
    NSString *unencodedString = [decodedTextView string];
    
    if(selectedRange.length == 0) {
        // no text selected
        return;
    } else {
        NSString *textInRange = [unencodedString substringWithRange:selectedRange];
        NSString *textBeforeRange = [unencodedString substringToIndex:selectedRange.location];
        
        NSLog(@"text before range: %@", textBeforeRange);
        NSLog(@"text in range: %@", textInRange);
        
    }
}
@end

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
@synthesize encodeButton;
@synthesize decodeButton;
@synthesize decodedTextView;
@synthesize encodedTextView;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application
    [encodedTextView setRichText:FALSE];
    [decodedTextView setRichText:FALSE];
}

- (void)textDidChange:(NSNotification *)aNotification {
    if(textViewLocked == false) {
        textViewLocked = true;
        if([decodedTextView isEqual:[aNotification object]]) {
            // sender is decoded text view do encode
            [encodedTextView setString:[self urlEncode:([decodedTextView string])]];
            
        }
        
        if([encodedTextView isEqual:[aNotification object]]) {
            // sender is encoded text view do decode
            [decodedTextView setString:[self urlDecode:[encodedTextView string]]];
            
        }
        textViewLocked = false;
    }
}

- (void)textViewDidChangeSelection:(NSNotification *)aNotification {
    if(textViewLocked == false) {
        textViewLocked = true;
        if([decodedTextView isEqual:[aNotification object]]) {
            // sender is decoded text view
            [self setSelectionBy:decodedTextView To:encodedTextView EncodeMode:true];
        }
        
        if([encodedTextView isEqual:[aNotification object]]) {
            // sender is encoded text view
            [self setSelectionBy:encodedTextView To:decodedTextView EncodeMode:false];
        }
        textViewLocked = false;
    }
}

- (NSString *)urlEncode:(NSString *)unencodedString {
    NSString *encodedString = (NSString *)CFURLCreateStringByAddingPercentEscapes
    (NULL,
     (CFStringRef)unencodedString,
     NULL,
     (CFStringRef)@"!*'();:@&=+$,/?%#[]",
     kCFStringEncodingUTF8);
    
    return encodedString;
}

- (NSString *)urlDecode:(NSString *)encodedString {
    if(encodedString == nil || [encodedString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] == nil) {
        return @"";
    } else {
        return [encodedString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
}

- (void)setSelectionBy:(NSTextView *)sourceTextView To:(NSTextView *)targetTextView EncodeMode:(Boolean)isEncode {
    NSRange selectedRange = [sourceTextView selectedRange];
    NSString *wholeText = [sourceTextView string];
    
    if(selectedRange.length == 0) {
        // no text selected
        return;
    } else {
        NSString *textInRange = [wholeText substringWithRange:selectedRange];
        NSString *textBeforeRange = [wholeText substringToIndex:selectedRange.location];
        
        NSString *processedTextInRange;
        NSString *processedTextBeforeRange;
        if(isEncode == true) {
            processedTextInRange = [self urlEncode:textInRange];
            processedTextBeforeRange = [self urlEncode:textBeforeRange];
        } else {
            processedTextInRange = [self urlDecode:textInRange];
            processedTextBeforeRange = [self urlDecode:textBeforeRange];
        }
        
        int highLightLocation = processedTextBeforeRange.length;
        int highLightLength = processedTextInRange.length;
        
        if(highLightLocation == 0 && textBeforeRange.length != 0) {
            // can not find correct text in target text view, give up
            [targetTextView setSelectedRange:NSMakeRange(0, 0)];
            return;
        }
        
        [targetTextView setSelectedRange:NSMakeRange(highLightLocation, highLightLength)];
    }
}
@end

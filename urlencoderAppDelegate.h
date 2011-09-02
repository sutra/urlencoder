//
//  urlencoderAppDelegate.h
//  urlencoder
//
//  Created by Sutra Zhou on 11-8-31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface urlencoderAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    NSTextView *decodedTextView;
    NSTextView *encodedTextView;
    NSButton *decodedCopyButton;
    bool textViewLocked;
}

@property (assign) IBOutlet NSWindow *window;

@property (assign) IBOutlet NSTextView *decodedTextView;
@property (assign) IBOutlet NSTextView *encodedTextView;
@property (assign) IBOutlet NSButton *decodedCopyButton;

- (IBAction)copyDecodedText:(id)sender;
- (IBAction)copyEncodedText:(id)sender;
- (IBAction)copySelectedDecodedText:(id)sender;
- (IBAction)copySelectedEncodedText:(id)sender;
- (void)textDidChange:(NSNotification *)aNotification;
- (void)textViewDidChangeSelection:(NSNotification *)aNotification;
- (BOOL)windowShouldClose:(id)sender;

- (NSString *)urlEncode:(NSString *)unencodedString;
- (NSString *)urlDecode:(NSString *)encodedString;
- (void)setSelectionBy:(NSTextView *)sourceTextView To:(NSTextView *)targetTextView EncodeMode:(Boolean)isEncode;
@end

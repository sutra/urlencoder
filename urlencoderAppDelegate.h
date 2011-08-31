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
    NSTextField *encodedTextField;
    NSButton *encodeButton;
    NSButton *decodeButton;
    NSTextView *decodedTextView;
}

@property (assign) IBOutlet NSWindow *window;

@property (assign) IBOutlet NSTextField *encodedTextField;
@property (assign) IBOutlet NSButton *encodeButton;
@property (assign) IBOutlet NSButton *decodeButton;
@property (assign) IBOutlet NSTextView *decodedTextView;

- (IBAction)encode:(id)sender;
- (IBAction)decode:(id)sender;

@end

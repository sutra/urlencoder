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
	IBOutlet NSTextField *textTextField;
	IBOutlet NSTextField *encodedTextField;
}

@property (assign) IBOutlet NSWindow *window;

@property (assign) IBOutlet NSTextField *textTextField;

@property (assign) IBOutlet NSTextField *encodedTextField;

- (IBAction)encode:(id)sender;

@end

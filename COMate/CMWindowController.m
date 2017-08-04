//
//  CMWindowController.m
//  COMate
//
//  Created by Fool on 7/14/17.
//  Copyright © 2017 Itsme. All rights reserved.
//

#import "CMWindowController.h"

@interface CMWindowController ()

@end

@implementation CMWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    _bugTitleField = [NSTextField new];
    [_bugTitleField setAlignment:NSTextAlignmentCenter];
    [_bugTitleField setBordered:NO];
    [_bugTitleField setDrawsBackground:NO];
    
}

@end

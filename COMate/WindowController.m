//
//  WindowController.m
//  COMate
//
//  Created by Fool on 5/19/17.
//  Copyright © 2017 Itsme. All rights reserved.
//

#import "WindowController.h"
#import "COMWindow.h"

@interface WindowController ()

@property (weak) IBOutlet COMWindow *comWindow;

@end

@implementation WindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
//    [sel setTitleVisibility:NSWindowTitleHidden];
//    [self.comWindow setTitleVisibility:NSWindowTitleHidden];
    [self.comWindow setTitleBarHeight:100];
}

@end

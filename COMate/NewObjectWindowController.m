//
//  NewObjectWindowController.m
//  COMate
//
//  Created by Fool on 7/12/17.
//  Copyright © 2017 Itsme. All rights reserved.
//

#import "NewObjectWindowController.h"

@interface NewObjectWindowController ()

@end

@implementation NewObjectWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)cancel:(id)sender
{
    [[self.window sheetParent] endSheet:self.window returnCode:NSModalResponseCancel];
}
- (IBAction)done:(id)sender
{
    [[self.window sheetParent] endSheet:self.window returnCode:NSModalResponseOK];
}

@end

//
//  MainWindowController.h
//  COMate
//
//  Created by Fool on 7/10/17.
//  Copyright © 2017 Itsme. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "INAppStoreWindow.h"

@interface MainWindowController : NSWindowController

@property (weak) IBOutlet NSImageView *bugImageView;
@property (weak) IBOutlet NSOutlineView *mainOutlineView;

@end

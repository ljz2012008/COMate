//
//  MainDeviceListTableCellView.h
//  COMate
//
//  Created by Fool on 7/11/17.
//  Copyright © 2017 Itsme. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MainDeviceFlagView.h"

static NSString *mainDeviceCellViewIdentifier = @"CMDeviceIdentifier";

@interface MainDeviceListTableCellView : NSTableCellView

@property (weak) IBOutlet NSImageView *avatarView;
@property (weak) IBOutlet NSTextField *titleField;
@property (weak) IBOutlet MainDeviceFlagView *flagView;

@end

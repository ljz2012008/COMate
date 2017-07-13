//
//  COMWindow.h
//  COMate
//
//  Created by Fool on 5/19/17.
//  Copyright © 2017 Itsme. All rights reserved.
//

// Reference come from https://github.com/weAreYeah/WAYWindow

#import <Cocoa/Cocoa.h>

@interface COMWindow : NSWindow

@property (strong,readonly) NSView *titleBarView;
///
@property (nonatomic) IBInspectable CGFloat titleBarHeight;

/// If set to YES, the standard window button will be vertically centered. Default: YES.
@property (nonatomic) IBInspectable BOOL centerTrafficLightButtons;
/// Defines the top margin of the standard window buttons. Used if not centered. Defaut: OS X default value.
@property (nonatomic) IBInspectable CGFloat trafficLightButtonsTopMargin;
/// Defines the left margin of the standard window buttons. Defaut: OS X default value.
@property (nonatomic) IBInspectable CGFloat trafficLightButtonsLeftMargin;

@property (nonatomic) IBInspectable BOOL hideTite;

@end

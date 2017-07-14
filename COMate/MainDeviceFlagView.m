//
//  MainDeviceFlagView.m
//  COMate
//
//  Created by Fool on 7/12/17.
//  Copyright © 2017 Itsme. All rights reserved.
//

#import "MainDeviceFlagView.h"

@implementation MainDeviceFlagView


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    
    //// Color Declarations
    NSColor* color = [NSColor colorWithCalibratedRed: 0.922 green: 0.922 blue: 0.922 alpha: 1];
    NSColor* color4 = [NSColor colorWithCalibratedRed: 0.624 green: 0.624 blue: 0.624 alpha: 1];
    
    //// Rectangle Drawing
    NSBezierPath* rectanglePath = [NSBezierPath bezierPathWithRoundedRect: dirtyRect xRadius: 5 yRadius: 5];
    [color setFill];
    [rectanglePath fill];
    [color4 setStroke];
    [rectanglePath setLineWidth: 2];
    [rectanglePath stroke];
}

@end

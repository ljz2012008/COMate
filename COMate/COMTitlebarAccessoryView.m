//
//  COMTitlebarAccessoryView.m
//  COMate
//
//  Created by Foolery on 6/6/17.
//  Copyright © 2017 Itsme. All rights reserved.
//

#import "COMTitlebarAccessoryView.h"

@implementation COMTitlebarAccessoryView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    //// Color Declarations
    NSColor* color = [NSColor colorWithCalibratedRed: 0 green: 0.31 blue: 0.478 alpha: 1];
    
    //// Rectangle Drawing
    NSBezierPath* rectanglePath = [NSBezierPath bezierPathWithRect: self.frame];
    [color setFill];
    [rectanglePath fill];

}

@end

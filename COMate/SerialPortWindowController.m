//
//  SerialPortWindowController.m
//  COMate
//
//  Created by Fool on 7/11/17.
//  Copyright © 2017 Itsme. All rights reserved.
//

#import "SerialPortWindowController.h"

@interface SerialPortWindowController ()

@end

@implementation SerialPortWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    INAppStoreWindow *inWindow = (INAppStoreWindow *)self.window;
    inWindow.trafficLightButtonsLeftMargin = 7.0;
    inWindow.fullScreenButtonRightMargin = 7.0;
    inWindow.centerFullScreenButton = YES;
    inWindow.titleBarHeight = 50.0;
    inWindow.showsTitle = YES;
    
    inWindow.titleBarDrawingBlock = ^(BOOL drawsAsMainWindow, CGRect drawingRect, CGRectEdge edge, CGPathRef clippingPath) {
        CGContextRef ctx = [[NSGraphicsContext currentContext] graphicsPort];
        if (clippingPath) {
            CGContextAddPath(ctx, clippingPath);
            CGContextClip(ctx);
        }
        //// Color Declarations
        NSColor* color = [NSColor colorWithCalibratedRed: 0 green: 0.463 blue: 0.31 alpha: 1];
        
        //// Rectangle Drawing
        NSBezierPath* rectanglePath = [NSBezierPath bezierPathWithRect: drawingRect];
        [[NSColor blueColor] setFill];
        [rectanglePath fill];
    };

}

@end

//
//  NetworkPortWindowController.m
//  COMate
//
//  Created by Fool on 7/14/17.
//  Copyright © 2017 Itsme. All rights reserved.
//

#import "NetworkPortWindowController.h"

#import <Masonry.h>

@interface NetworkPortWindowController ()

@end

@implementation NetworkPortWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    INAppStoreWindow *inWindow = (INAppStoreWindow *)self.window;
    inWindow.title = @"";
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
        [[NSColor grayColor] setFill];
        [rectanglePath fill];
    };
    
    _bugTitleField.stringValue = [NSString stringWithFormat:@"%@", [self className]];
    __weak __typeof(&*inWindow.titleBarView) weakView = inWindow.titleBarView;
    [inWindow.titleBarView addSubview:_bugTitleField];
    [_bugTitleField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakView);
        make.left.equalTo(weakView).with.offset(100);
        make.right.equalTo(weakView).with.offset(-100);
    }];
    
}

@end

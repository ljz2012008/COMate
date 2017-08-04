//
//  SerialPortWindowController.m
//  COMate
//
//  Created by Fool on 7/11/17.
//  Copyright © 2017 Itsme. All rights reserved.
//

#import "SerialPortWindowController.h"

#import <Masonry.h>

@interface SerialPortWindowController () <NSPopoverDelegate>

@property (strong) NSPopover *activePopver;

@end

@implementation SerialPortWindowController

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
//        //// Color Declarations
//        NSColor* color = [NSColor colorWithCalibratedRed: 0.388 green: 0.322 blue: 0.624 alpha: 1];
//        
//        //// Rectangle Drawing
//        NSBezierPath* rectanglePath = [NSBezierPath bezierPathWithRect: drawingRect];
//        [color setFill];
//        [rectanglePath fill];
        
        //// Color Declarations
        NSColor* gradient2Color = [NSColor colorWithCalibratedRed: 0.302 green: 0.31 blue: 0.361 alpha: 1];
        NSColor* gradient2Color2 = [NSColor colorWithCalibratedRed: 0.427 green: 0.416 blue: 0.451 alpha: 1];
        
        //// Gradient Declarations
        NSGradient* gradient2 = [NSGradient.alloc initWithStartingColor: gradient2Color2 endingColor: gradient2Color];
        
        //// Rectangle Drawing
        NSBezierPath* rectanglePath = [NSBezierPath bezierPathWithRect: drawingRect];
        [gradient2 drawInBezierPath: rectanglePath angle: 135];
    };

    _bugTitleField.stringValue = [NSString stringWithFormat:@"%@", [self className]];
    __weak __typeof(&*inWindow.titleBarView) weakView = inWindow.titleBarView;
    [inWindow.titleBarView addSubview:_bugTitleField];
    [_bugTitleField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakView);
        make.left.equalTo(weakView).with.offset(100);
        make.right.equalTo(weakView).with.offset(-100);
    }];
    
    NSPopUpButton *portButton = [NSPopUpButton new];
    [portButton setFrame:NSMakeRect(100, 5, 100, 30)];
    [portButton setBordered:NO];
    
    [portButton addItemWithTitle:@"Z"];
    
    [inWindow.titleBarView addSubview:portButton];
}

#pragma mark - filters

- (IBAction)setFilterButtonClicked:(id)sender
{
    if (_activePopver) {
        [_activePopver performClose:self];
        _activePopver = nil;
    }
    
    _activePopver = [NSPopover new];
    [_activePopver setDelegate:self];
    [_activePopver setBehavior:NSPopoverBehaviorTransient];
}

@end

//
//  AppDelegate.m
//  GRCustomizableWindow Demo
//
//  Created by Guilherme Rambo on 26/02/14.
//  Copyright (c) 2014 Guilherme Rambo. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()



@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.window.titlebarHeight = @100;
    self.window.controlsXOffset = 10.f;
    self.window.titlebarColor = [NSColor colorWithCalibratedRed:0 green:0 blue:0 alpha:1.000];
    self.window.titleColor = [NSColor colorWithCalibratedWhite:1.0 alpha:1.0];
//    self.window.backgroundColor = [NSColor colorWithCalibratedRed:1 green:1 blue:1 alpha:1.000];
    self.window.centerControls = YES;
    
//    self.cbWindow.titlebarColor = [NSColor colorWithCalibratedRed:0.987 green:0.217 blue:0.160 alpha:1.000];
//    self.cbWindow.titleColor = [NSColor colorWithCalibratedWhite:1.0 alpha:1.0];
//    self.cbWindow.backgroundColor = [NSColor colorWithCalibratedRed:0.995 green:0.787 blue:0.664 alpha:1.000];
//    
//    [self.textView.textStorage readFromURL:[[NSBundle mainBundle] URLForResource:@"Info" withExtension:@"rtf"] options:nil documentAttributes:nil];
//    
//    self.texturedWindow.titlebarColor = [NSColor colorWithCalibratedRed:0.433 green:0.902 blue:0.213 alpha:1.000];
//    self.texturedWindow.titleColor = [NSColor colorWithCalibratedRed:0.165 green:0.322 blue:0.090 alpha:1.000];
//
//    self.leatherWindow.titlebarColor = [NSColor colorWithPatternImage:[NSImage imageNamed:@"Leather"]];
//    self.leatherWindow.titleColor = [NSColor whiteColor];
//    self.leatherWindow.enableGradients = NO;
//    
//    self.flWindow.titlebarColor = [NSColor colorWithCalibratedWhite:0.9 alpha:1.0];
//    self.flWindow.enableGradients = NO;
}

@end

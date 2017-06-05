//
//  AppDelegate.m
//  titlebar
//
//  Created by admin on 17/2/7.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTitleView.h"
@interface AppDelegate ()


@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.wc = [[WC alloc] initWithWindowNibName:@"WC"];
    [self.wc.window center];
    [self.wc.window orderFront:nil];
    NSRect boundsRect = [[[self.wc.window contentView] superview] bounds];
    MyTitleView * titleview = [[MyTitleView alloc] initWithFrame:boundsRect];
    [titleview setAutoresizingMask:(NSViewWidthSizable | NSViewHeightSizable)];
    [[[self.wc.window contentView] superview] addSubview:titleview positioned:NSWindowBelow relativeTo:[[[[self.wc.window contentView] superview] subviews] objectAtIndex:0]];
    titleview.text = @"aaa";
    titleview.color = [NSColor colorWithCalibratedRed:0 green:0 blue:0 alpha:1];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end

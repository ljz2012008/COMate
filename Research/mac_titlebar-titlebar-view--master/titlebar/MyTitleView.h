//
//  MyTitleView.h
//  RIPperDVD
//
//  Created by admin on 17/2/6.
//  Copyright © 2017年 admin. All rights reserved.
//

/**
 *
 需要MyTitleView：
 单独titlebar的自定义包括颜色和title
 需要加上下面的代码（不推荐使用，原因在10.9之后出现警告）NSWindow warning: adding an unknown subview: <MyTitleView: 0x600000123700>
 
       NSRect boundsRect = [[[self.window contentView] superview] bounds];
       MyTitleView * titleview = [[MyTitleView alloc] initWithFrame:boundsRect];
       [titleview setAutoresizingMask:(NSViewWidthSizable | NSViewHeightSizable)];
       [[[self.window contentView] superview] addSubview:titleview positioned:NSWindowBelow relativeTo:[[[[self.window contentView] superview] subviews] objectAtIndex:0]];
 */

/**
 * 
 不需要MyTitleView：
 改变titlebar加toolbar颜色 (更加简便，兼容未来版本，缺点：titlebar与toolbar为一整体)
 
        NSButton *miniaturizeButton = [self.window standardWindowButton: NSWindowMiniaturizeButton];
        NSView *titleBarView = [miniaturizeButton superview];
        titleBarView.wantsLayer = YES;
        titleBarView.layer.backgroundColor = [NSColor whiteColor].CGColor;
        self.window.titlebarAppearsTransparent = YES;//使颜色不是半透明
        self.window.titleVisibility = NSWindowTitleHidden;//titlebar与toolbar合并一行，去掉title
 */
#import <Cocoa/Cocoa.h>

@interface MyTitleView : NSView
@property (nonatomic,retain)NSString *text;//默认为空
//[NSColor colorWithCalibratedRed:0 green:0 blue:1 alpha:1]
@property (nonatomic,retain)NSColor *color;

@end

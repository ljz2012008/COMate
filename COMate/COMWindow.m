//
//  COMWindow.m
//  COMate
//
//  Created by Fool on 5/19/17.
//  Copyright © 2017 Itsme. All rights reserved.
//

#import "COMWindow.h"
#import "COMTitlebarAccessoryView.h"

@interface COMWindow () <NSWindowDelegate>

@property (strong) NSArray *standardButtons;
@property (strong) NSTitlebarAccessoryViewController *dummyTitlebarAccessoryViewController;

@end

@implementation COMWindow

#pragma mark - NSWindow Overwritings
- (instancetype)initWithContentRect:(NSRect)contentRect styleMask:(NSWindowStyleMask)style backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag
{
    if (self == [super initWithContentRect:contentRect styleMask:style backing:bufferingType defer:flag]) {
        [self _setUp];
    }
    return self;
}

- (instancetype)initWithContentRect:(NSRect)contentRect styleMask:(NSWindowStyleMask)style backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag screen:(NSScreen *)screen
{
    if (self == [super initWithContentRect:contentRect styleMask:style backing:bufferingType defer:flag screen:screen]) {
        [self _setUp];
    }
    return self;
}

- (void)orderFront:(id)sender
{
    [super orderFront:sender];
    [self _setNeedLayout];
}

#pragma mark - Public
- (void)setTitleBarHeight:(CGFloat)titleBarHeight
{
    _titleBarHeight = titleBarHeight;
    
    if (_dummyTitlebarAccessoryViewController) {
        [self removeTitlebarAccessoryViewControllerAtIndex:0];
    }
    NSArray *arrt = self.titlebarAccessoryViewControllers;
    COMTitlebarAccessoryView *view = [[COMTitlebarAccessoryView alloc] initWithFrame:NSMakeRect(0, 0, 100, 100)];
//    [view setImage:[NSImage imageNamed:@"123.png"]];
    
    _dummyTitlebarAccessoryViewController = [NSTitlebarAccessoryViewController new];
    _dummyTitlebarAccessoryViewController.view = view;
    [_dummyTitlebarAccessoryViewController.view setAutoresizesSubviews:YES];
//    _dummyTitlebarAccessoryViewController.layoutAttribute = NSLayoutAttributeRight;
    _dummyTitlebarAccessoryViewController.fullScreenMinHeight = titleBarHeight;
    [self addTitlebarAccessoryViewController:_dummyTitlebarAccessoryViewController];
    
    
    [self _setNeedLayout];
    NSRect frame = self.frame;
//    frame.size.height 
    [self setFrame:frame display:NO];
}

- (void)setHideTite:(BOOL)HideTite
{
    _hideTite = HideTite;
    [self setTitleVisibility:HideTite ? NSWindowTitleHidden : NSWindowTitleVisible];
}

#pragma mark - Private
- (void)_setUp
{
    _standardButtons = @[[self standardWindowButton:NSWindowCloseButton],
                         [self standardWindowButton:NSWindowMiniaturizeButton],
                         [self standardWindowButton:NSWindowZoomButton]];
    
    self.styleMask |= NSFullSizeContentViewWindowMask;
    
    self.hideTite = YES;
    
    _centerTrafficLightButtons = YES;
    _trafficLightButtonsTopMargin = 0.0;
    _trafficLightButtonsLeftMargin = 12;
    
    [super setDelegate:self];
    [self _setNeedLayout];
}

- (void)_setNeedLayout
{
    NSView *view = [_standardButtons[0] superview];
    [_standardButtons[0] removeFromSuperview];
    [_standardButtons[1] removeFromSuperview];
    [_standardButtons[2] removeFromSuperview];
    [_standardButtons enumerateObjectsUsingBlock:^(NSButton*  _Nonnull standardButton, NSUInteger idx, BOOL * _Nonnull stop) {
        NSRect frame = standardButton.frame;
        if (_centerTrafficLightButtons) {
            frame.origin.y = NSHeight([view frame]) /2 - NSHeight(frame) / 2;
        } else {
            frame.origin.y = NSHeight([view frame]) - NSHeight(frame) - _trafficLightButtonsTopMargin;
        }
        
        frame.origin.x = _trafficLightButtonsLeftMargin + idx*(NSWidth(frame) + 6);
        [standardButton setFrame:frame];
        [view addSubview:standardButton];
    }];
}


#pragma mark - NSWindow Delegate
- (void)windowDidResize:(NSNotification *)notification
{
    [self _setNeedLayout];
}

@end

//
//  MainWindowController.m
//  COMate
//
//  Created by Fool on 7/10/17.
//  Copyright © 2017 Itsme. All rights reserved.
//

#import "MainWindowController.h"
#import "MainDeviceListTableCellView.h"

#import "NewObjectWindowController.h"
#import "SerialPortWindowController.h"
#import "GPIBWindowController.h"
#import "NetworkPortWindowController.h"
#import "BluetoothWindowController.h"

#import "CMEntity.h"

#import <Masonry.h>


@interface MainWindowController () <NSOutlineViewDataSource, NSOutlineViewDelegate>

@property (strong) NSWindowController *tempWindowController;

@property (strong) NSMutableArray *windowControllers;

@property (strong) NewObjectWindowController *nnwObjectWindowController;
@property (strong) NSMutableArray *mainList;

@end

@implementation MainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    [self _setWindowAttribute];
    
    [_mainOutlineView registerNib:[[NSNib alloc] initWithNibNamed:@"MainDeviceListTableCellView" bundle:nil] forIdentifier:mainDeviceCellViewIdentifier];
    [_mainOutlineView setDoubleAction:@selector(doubleAction:)];
    
    _windowControllers = [NSMutableArray new];
    _mainList = [NSMutableArray new];
    CMEntity *entity = [[CMEntity alloc] initWithTitle:@"Serial Port"
                                            deviceType:CMSerialPortType byUserName:@"Taylor"];
    entity.stateType = CMOpenStateType;
    CMEntity *entity1 = [[CMEntity alloc] initWithTitle:@"GPIB Port"
                                             deviceType:CMGPIBType byUserName:@"Taylor"];
    entity1.stateType = CMCloseStateType;
    CMEntity *entity2 = [[CMEntity alloc] initWithTitle:@"Network Port"
                                             deviceType:CMNetworkType byUserName:@"Taylor"];
    entity2.stateType = CMUnkonwStateType;
    CMEntity *entity3 = [[CMEntity alloc] initWithTitle:@"Bluetooth Port"
                                             deviceType:CMBluetoothType byUserName:@"Taylor"];
    entity3.stateType = CMOpenStateType;
    [_mainList addObject:entity];
    [_mainList addObject:entity1];
    [_mainList addObject:entity2];
    [_mainList addObject:entity3];
    
    [_mainOutlineView reloadData];
}

#pragma mark - Action
- (void)_setWindowAttribute
{
    INAppStoreWindow *inWindow = (INAppStoreWindow *)self.window;
    inWindow.trafficLightButtonsLeftMargin = 7.0;
    inWindow.fullScreenButtonRightMargin = 7.0;
    inWindow.centerFullScreenButton = YES;
    inWindow.titleBarHeight = 50.0;
    inWindow.showsTitle = NO;
    
    inWindow.titleTextColor = [NSColor redColor];
    inWindow.titleBarDrawingBlock = ^(BOOL drawsAsMainWindow, CGRect drawingRect, CGRectEdge edge, CGPathRef clippingPath) {
//        //// Color Declarations
//        NSColor* color = [NSColor colorWithCalibratedRed: 0 green: 0.463 blue: 0.31 alpha: 1];
//        
//        //// Rectangle Drawing
//        NSBezierPath* rectanglePath = [NSBezierPath bezierPathWithRect: drawingRect];
//        [[NSColor redColor] setFill];
//        [rectanglePath fill];
//        CGContextRef ctx = [[NSGraphicsContext currentContext] graphicsPort];
////        if (clippingPath) {
////            CGContextAddPath(ctx, clippingPath);
////            CGContextClip(ctx);
////        }
//
//        NSGradient *gradient = nil;
//        if (drawsAsMainWindow) {
//            gradient = [[NSGradient alloc] initWithStartingColor:[NSColor colorWithCalibratedRed: 0 green: 0.463 blue: 0.31 alpha: 1]
//                                                     endingColor:[NSColor colorWithCalibratedRed: 0 green: 0.463 blue: 0.31 alpha: 1]];
//            [[NSColor darkGrayColor] setFill];
//        } else {
//            // set the default non-main window gradient colors
//            gradient = [[NSGradient alloc] initWithStartingColor:[NSColor colorWithCalibratedWhite:0.851f alpha:1]
//                                                     endingColor:[NSColor colorWithCalibratedWhite:0.929f alpha:1]];
//            [[NSColor colorWithCalibratedRed: 0 green: 0.463 blue: 0.31 alpha: 1] setFill];
//        }
//        [gradient drawInRect:drawingRect angle:90];
//#if !__has_feature(objc_arc)
//        [gradient release];
//#endif
//        NSRectFill(NSMakeRect(NSMinX(drawingRect), NSMinY(drawingRect), NSWidth(drawingRect), 1));
        
        //// Color Declarations
        NSColor* color = [NSColor colorWithCalibratedRed: 0 green: 0.463 blue: 0.31 alpha: 1];
        
        //// Rectangle Drawing
        NSBezierPath* rectanglePath = [NSBezierPath bezierPathWithRect: drawingRect];
        [color setFill];
        [rectanglePath fill];
    };
    
    __weak __typeof(&*inWindow.titleBarView) weakView = inWindow.titleBarView;
    [inWindow.titleBarView addSubview:_bugImageView];
    [_bugImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakView);
        make.size.mas_equalTo(CGSizeMake(111, 37));
    }];
}

- (IBAction)NewObject:(id)sender
{
    _nnwObjectWindowController = [[NewObjectWindowController alloc] initWithWindowNibName:@"NewObjectWindowController"];
    
    [self.window beginSheet:_nnwObjectWindowController.window completionHandler:^(NSModalResponse returnCode)
    {
        if (returnCode == NSModalResponseOK)
        {
            
        } else if (returnCode == NSModalResponseCancel)
        {
            
        }
        _nnwObjectWindowController = nil;
    }];
}

- (IBAction)doubleAction:(id)sender
{
    NSInteger rowIndex = [_mainOutlineView selectedRow];
    CMEntity *rowEntity = [_mainOutlineView itemAtRow:rowIndex];
    id aTempWindowController;
    if (!rowEntity.master) {
        if (rowEntity.deviceType == CMSerialPortType) {
            aTempWindowController = [[SerialPortWindowController alloc] initWithWindowNibName:@"SerialPortWindowController"];
        } else if (rowEntity.deviceType == CMGPIBType) {
            aTempWindowController = [[GPIBWindowController alloc] initWithWindowNibName:@"GPIBWindowController"];
        } else if (rowEntity.deviceType == CMNetworkType) {
            aTempWindowController = [[NetworkPortWindowController alloc] initWithWindowNibName:@"NetworkPortWindowController"];
        } else if (rowEntity.deviceType == CMBluetoothType) {
            aTempWindowController = [[BluetoothWindowController alloc] initWithWindowNibName:@"BluetoothWindowController"];
        }
        
        
        [_windowControllers addObject:aTempWindowController];
        rowEntity.master = aTempWindowController;
    }
    
    if ([_windowControllers containsObject:rowEntity.master]) {
        [rowEntity.master showWindow:nil];
    }
}

#pragma mark - NSOutlineViewDataSource
- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item
{
    if (item == nil) {
        return _mainList.count;
    }
    return [item children] ? [item children].count : 0;
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item
{
    return item ? [[item children] objectAtIndex:index] : _mainList[index];
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item
{
    return NO;
}

#pragma mark - NSOutlineViewDelegate
- (NSView *)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item
{
    MainDeviceListTableCellView *cellView = [outlineView makeViewWithIdentifier:mainDeviceCellViewIdentifier owner:nil];
    CMEntity *entity = item;
    cellView.objectValue = entity;
    
    return cellView;
}

- (CGFloat)outlineView:(NSOutlineView *)outlineView heightOfRowByItem:(id)item
{
    return 50.0;
}
//- (BOOL)outlineView:(NSOutlineView *)outlineView isGroupItem:(id)item
//{
//    return NO;
//}

@end

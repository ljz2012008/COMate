//
//  MainDeviceListTableCellView.m
//  COMate
//
//  Created by Fool on 7/11/17.
//  Copyright © 2017 Itsme. All rights reserved.
//

#import "MainDeviceListTableCellView.h"
#import "CMEntity.h"

#define kMDLObjectValueTitle @"objectValue.title"
#define kMDLObjectValueDeviceType @"objectValue.deviceType"
#define kMDFObjectValueStateType @"objectValue.StateType"

@implementation MainDeviceListTableCellView

- (void)dealloc
{
    [self removeObserver:self forKeyPath:kMDLObjectValueTitle];
    [self removeObserver:self forKeyPath:kMDLObjectValueDeviceType];
    [self removeObserver:self forKeyPath:kMDFObjectValueStateType];
}

- (void)awakeFromNib
{
    [self addObserver:self forKeyPath:kMDLObjectValueTitle options:0 context:NULL];
    [self addObserver:self forKeyPath:kMDLObjectValueDeviceType options:0 context:NULL];
    [self addObserver:self forKeyPath:kMDFObjectValueStateType options:0 context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (!self.objectValue)
        return;
    
    if ([keyPath isEqualToString:kMDLObjectValueTitle]) {
        NSString *rawTitle = [self.objectValue title];
        [_titleField setStringValue:rawTitle];
    }
    if ([keyPath isEqualToString:kMDLObjectValueDeviceType]) {
        CMEntityDeviceType rawDeviceType = [self.objectValue deviceType];
        if (rawDeviceType == CMSerialPortType) {
            _avatarView.image = [NSImage imageNamed:@"SerialPort1"];
        } else if (rawDeviceType == CMGPIBType) {
            _avatarView.image = [NSImage imageNamed:@"GPIBPort"];
        } else if (rawDeviceType == CMNetworkType) {
            _avatarView.image = [NSImage imageNamed:@"NetworkPort"];
        } else if (rawDeviceType == CMBluetoothType) {
            _avatarView.image = [NSImage imageNamed:@"BlueTooth"];
        }
    }
    // NSStatusAvailable NSStatusNone NSStatusPartiallyAvailable NSStatusUnavailable
    if ([keyPath isEqualToString:kMDFObjectValueStateType]) {
        CMEntityStateType rawStateType = [self.objectValue stateType];
        if (rawStateType == CMOpenStateType) {
            _flagView.flagImageView.image = [NSImage imageNamed:@"NSStatusAvailable"];
            _flagView.flagField.stringValue = @"enable";
        }
        if (rawStateType == CMCloseStateType) {
            _flagView.flagImageView.image = [NSImage imageNamed:@"NSStatusUnavailable"];
            _flagView.flagField.stringValue = @"disable";
        }
        if (rawStateType == CMUnkonwStateType) {
            _flagView.flagImageView.image = [NSImage imageNamed:@"NSStatusNone"];
            _flagView.flagField.stringValue = @"None";
        }
    }
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end

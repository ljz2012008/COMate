//
//  CMEntity.h
//  COMate
//
//  Created by Fool on 7/11/17.
//  Copyright © 2017 Itsme. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMUser.h"

typedef NS_ENUM(NSUInteger, CMEntityDeviceType) {
    CMSerialPortType,
    CMGPIBType,
    CMNetworkType,
    CMBluetoothType,
    CMGroupType,
    CMUnknowDeviceType,
};

typedef NS_ENUM(NSUInteger, CMEntityStateType) {
    CMOpenStateType,
    CMCloseStateType,
    CMUnkonwStateType,
};

@interface CMEntity : NSObject

@property (assign) CMEntityStateType stateType;
@property (assign) CMEntityDeviceType deviceType;
@property (strong) CMUser *user;

@property (assign) NSInteger fd;
@property (strong) NSString *title;
@property (weak) NSImage *avatar;


@property (strong) NSDate *createdDate;
@property (strong) NSDate *lastUpdatedDate;

@property (weak) id master;
@property (strong) NSMutableArray *children;

- (id)initWithGroupName:(NSString *)gName;
- (instancetype)initWithTitle:(NSString *)aTitle byUserName:(NSString *)aName;
- (id)initWithTitle:(NSString *)aTitle deviceType:(CMEntityDeviceType)aDeviceType byUserName:(NSString *)aName;

@end

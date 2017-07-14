//
//  CMEntity.m
//  COMate
//
//  Created by Fool on 7/11/17.
//  Copyright © 2017 Itsme. All rights reserved.
//

#import "CMEntity.h"

@implementation CMEntity

- (id)initWithGroupName:(NSString *)gName
{
    self = [super init];
    if (self) {
        _stateType = CMUnkonwStateType;
        _deviceType = CMGroupType;
        _fd = -1;
        _user = nil;
        _title = gName;
        
        _avatar = nil;
        
        _createdDate = [NSDate new];
        _lastUpdatedDate = [NSDate new];
        _master = nil;
        _children = [NSMutableArray new];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)aTitle byUserName:(NSString *)aName
{
    self = [super init];
    if (self) {
        _stateType = CMUnkonwStateType;
        _deviceType = CMUnknowDeviceType;
        _user = [[CMUser alloc] initWithName:aName];
        _title = aTitle;
        
        _avatar = nil;
        
        _createdDate = [NSDate new];
        _lastUpdatedDate = [NSDate new];
        _master = nil;
        _children = nil;
    }
    return self;
}

- (id)initWithTitle:(NSString *)aTitle deviceType:(CMEntityDeviceType)aDeviceType byUserName:(NSString *)aName
{
    self = [self initWithTitle:aTitle byUserName:aName];
    if (self) {
        self.deviceType = aDeviceType;
    }
    return self;
}

@end

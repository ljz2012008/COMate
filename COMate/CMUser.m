//
//  CMUser.m
//  COMate
//
//  Created by Fool on 7/11/17.
//  Copyright © 2017 Itsme. All rights reserved.
//

#import "CMUser.h"

@implementation CMUser

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        _name = name;
        _userID = -1;
        _macAddress = @"";
        _ipAddress  = @"";
    }
    return self;
}

@end

//
//  CMUser.h
//  COMate
//
//  Created by Fool on 7/11/17.
//  Copyright © 2017 Itsme. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMUser : NSObject

@property (strong) NSString *name;

@property (assign) NSInteger userID;
@property (strong) NSString *ipAddress;
@property (strong) NSString *macAddress;

- (instancetype)initWithName:(NSString *)name;

@end

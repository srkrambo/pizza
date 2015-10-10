//
//  EnvironmentHelper.h
//  NearbyPizza
//
//  Created by Rajkumar S on 10/10/15.
//  Copyright © 2015 Rajkumar S. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPRequestOperationManager;
@interface EnvironmentHelper : NSObject

@property (nonatomic,strong) AFHTTPRequestOperationManager *manager;
@property (nonatomic, strong) NSURL *hostURL;

+ (EnvironmentHelper*)sharedInstance;



@end

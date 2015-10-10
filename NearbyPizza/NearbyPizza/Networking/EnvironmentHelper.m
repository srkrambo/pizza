//
//  EnvironmentHelper.m
//  NearbyPizza
//
//  Created by Rajkumar S on 10/10/15.
//  Copyright © 2015 Rajkumar S. All rights reserved.
//

#import "EnvironmentHelper.h"
#import <AFNetworking/AFNetworking.h>

static EnvironmentHelper *envHelper = nil;

static NSString* baseURL = @"api.foursquare.com";


@implementation EnvironmentHelper

+ (EnvironmentHelper*)sharedInstance {
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        envHelper = [[EnvironmentHelper alloc] init];
    });
    [envHelper loadSettings];
    return envHelper;
}

- (void)loadSettings {
    _hostURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://%@/v2/", baseURL]];
    // AFNetworking
    _manager = [AFHTTPRequestOperationManager manager];
    _manager.responseSerializer = [AFJSONResponseSerializer serializer];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
}

@end

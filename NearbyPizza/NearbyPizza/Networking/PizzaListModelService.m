//
//  PizzaListModelService.m
//  NearbyPizza
//
//  Created by Rajkumar S on 10/10/15.
//  Copyright © 2015 Rajkumar S. All rights reserved.
//

#import "PizzaListModelService.h"
#import "EnvironmentHelper.h"
#import "Constants.h"
#import <AFNetworking/AFNetworking.h>
#import "VenueResponseModel.h"

@implementation PizzaListModelService

+ (void)fetchDataForLocation:(CLLocation *) location withCompletion:(void (^)(NSArray *venueArray, NSError *error, NSHTTPURLResponse *response))completion{
    AFHTTPRequestOperationManager *manager = [EnvironmentHelper sharedInstance].manager;
    [manager GET:[NSString stringWithFormat:@"%@venues/search?client_id=%@&client_secret=%@&v=20130815&near=%@&query=pizza&limit=5",[EnvironmentHelper sharedInstance].hostURL, kFoursquareClientID, kFoursquareClientSecret, [NSString stringWithFormat:@"%f,%f",location.coordinate.latitude, location.coordinate.longitude]] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (completion) {
            NSError *error;

            VenueResponseModel *responseModel = [[VenueResponseModel alloc]initWithDictionary:responseObject error:&error];
            if (completion) {
                completion(responseModel.response.venues,error,operation.response);
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
        }
        
    }];
}

@end

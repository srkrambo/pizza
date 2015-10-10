//
//  PizzaListModelService.h
//  NearbyPizza
//
//  Created by Rajkumar S on 10/10/15.
//  Copyright © 2015 Rajkumar S. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface PizzaListModelService : NSObject

+ (void)fetchDataForLocation:(CLLocation *) location withCompletion:(void (^)(NSArray *venueArray, NSError *error, NSHTTPURLResponse *response))completion;
+ (NSArray *)fetchAllObjects;

@end

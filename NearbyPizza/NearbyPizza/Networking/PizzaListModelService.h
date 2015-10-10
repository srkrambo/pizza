//
//  PizzaListModelService.h
//  NearbyPizza
//
//  Created by Rajkumar S on 10/10/15.
//  Copyright © 2015 Rajkumar S. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PizzaListModelService : NSObject

+ (void)fetchDataWithCompletion:(void (^)(id responseData, NSError *error, NSHTTPURLResponse *response))completion;

@end

//
//  Location.h
//  NearbyPizza
//
//  Created by Rajkumar S on 10/10/15.
//  Copyright © 2015 Rajkumar S. All rights reserved.
//

#import "BaseModel.h"

@interface Location : BaseModel

@property (nonatomic) NSString *address;
@property (nonatomic) NSString *lat;
@property (nonatomic) NSString *lng;
@property (nonatomic) NSString *distance;
@property (nonatomic) NSString *postalCode;
@property (nonatomic) NSString *cc;
@property (nonatomic) NSString *city;
@property (nonatomic) NSString *state;
@property (nonatomic) NSString *country;
@property (nonatomic) NSArray *formattedAddress;

@end

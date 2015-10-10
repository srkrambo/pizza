//
//  BaseVenueModel.h
//  NearbyPizza
//
//  Created by Rajkumar S on 10/10/15.
//  Copyright © 2015 Rajkumar S. All rights reserved.
//

#import "BaseModel.h"
#import "VenueItem.h"

@interface BaseVenueModel : BaseModel

@property (nonatomic) NSArray<VenueItem> *venues;

@end

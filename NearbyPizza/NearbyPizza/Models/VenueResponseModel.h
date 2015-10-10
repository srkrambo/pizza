//
//  VenueResponseModel.h
//  NearbyPizza
//
//  Created by Rajkumar S on 10/10/15.
//  Copyright © 2015 Rajkumar S. All rights reserved.
//

#import "BaseResponseModel.h"
#import "BaseVenueModel.h"

@interface VenueResponseModel : BaseResponseModel

@property (nonatomic) BaseVenueModel *response;

@end

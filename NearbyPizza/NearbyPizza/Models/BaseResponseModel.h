//
//  BaseResponseModel.h
//  NearbyPizza
//
//  Created by Rajkumar S on 10/10/15.
//  Copyright © 2015 Rajkumar S. All rights reserved.
//

#import "BaseModel.h"
#import "MetaModel.h"

@interface BaseResponseModel : BaseModel

@property (nonatomic) MetaModel *meta;

@end

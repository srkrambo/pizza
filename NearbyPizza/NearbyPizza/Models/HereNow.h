//
//  HereNow.h
//  NearbyPizza
//
//  Created by Rajkumar S on 10/10/15.
//  Copyright © 2015 Rajkumar S. All rights reserved.
//

#import "BaseModel.h"

@interface HereNow : BaseModel

@property (nonatomic) NSInteger count;
@property (nonatomic) NSString *summary;
@property (nonatomic) NSArray *groups;

@end

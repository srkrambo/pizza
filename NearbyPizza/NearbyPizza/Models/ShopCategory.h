//
//  Category.h
//  NearbyPizza
//
//  Created by Rajkumar S on 10/10/15.
//  Copyright © 2015 Rajkumar S. All rights reserved.
//

#import "BaseModel.h"

@protocol ShopCategory

@end

@interface ShopCategory : BaseModel

@property (nonatomic) NSInteger count;
@property (nonatomic) NSArray *items;

@end

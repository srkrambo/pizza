//
//  VenueItem.h
//  NearbyPizza
//
//  Created by Rajkumar S on 10/10/15.
//  Copyright © 2015 Rajkumar S. All rights reserved.
//

#import "BaseModel.h"
#import "Contact.h"
#import "Location.h"
#import "Stats.h"
#import "Menu.h"
#import "Specials.h"
#import "HereNow.h"
#import "ShopCategory.h"

@protocol VenueItem

@end

@interface VenueItem : BaseModel

@property (nonatomic) NSString *identifier;
@property (nonatomic) NSString *name;
@property (nonatomic) Contact *contact;
@property (nonatomic) Location *location;
@property (nonatomic) NSArray<ShopCategory *> *categories;
@property (nonatomic) BOOL verified;
@property (nonatomic) Stats *stats;
@property (nonatomic) NSString *url;
@property (nonatomic) Menu *menu;
@property (nonatomic) BOOL allowMenuUrlEdit;
@property (nonatomic) Specials *specials;
@property (nonatomic) HereNow *hereNow;

@end

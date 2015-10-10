//
//  DetailViewController.h
//  NearbyPizza
//
//  Created by Rajkumar S on 10/10/15.
//  Copyright © 2015 Rajkumar S. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewController.h"
#import "VenueItem.h"
#import "PizzaShop.h"

@interface DetailViewController : BaseTableViewController

@property (nonatomic)VenueItem *venueItem;
@property (nonatomic) PizzaShop *shop;

@end

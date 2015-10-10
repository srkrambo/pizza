//
//  PizzaListTableViewCell.h
//  NearbyPizza
//
//  Created by Rajkumar S on 10/10/15.
//  Copyright © 2015 Rajkumar S. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VenueItem.h"
#import "PizzaShop.h"
#import "PizzaShop+CoreDataProperties.h"

@interface PizzaListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *statsLabel;

- (void)setCellWithVenueItem:(VenueItem *)venueItem;
- (void)setCellWithShop:(PizzaShop *)shop;

@end

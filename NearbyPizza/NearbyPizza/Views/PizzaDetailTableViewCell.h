//
//  PizzaDetailTableViewCell.h
//  NearbyPizza
//
//  Created by Rajkumar S on 10/10/15.
//  Copyright © 2015 Rajkumar S. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VenueItem.h"

@interface PizzaDetailTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *statsLabel;


- (void)setCellWithVenueItem:(VenueItem *)venueItem;


@end

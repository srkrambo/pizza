//
//  PizzaListTableViewCell.m
//  NearbyPizza
//
//  Created by Rajkumar S on 10/10/15.
//  Copyright © 2015 Rajkumar S. All rights reserved.
//

#import "PizzaListTableViewCell.h"

@implementation PizzaListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellWithVenueItem:(VenueItem *)venueItem {
    self.nameLabel.text = venueItem.name;
    if (venueItem.location.formattedAddress.count) {
        self.addressLabel.text = [venueItem.location.formattedAddress firstObject];
    }
    else{
        self.addressLabel.text = venueItem.location.address;
    }
    self.statsLabel.text = [NSString stringWithFormat:@"%@ tipped",venueItem.stats.tipCount];
}

- (void)setCellWithShop:(PizzaShop *)shop{
    self.nameLabel.text = shop.name;
    self.addressLabel.text = shop.address;
    self.statsLabel.text = [NSString stringWithFormat:@"%@ tipped",shop.tipCount];
}

@end

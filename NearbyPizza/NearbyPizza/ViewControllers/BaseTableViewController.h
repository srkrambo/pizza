//
//  BaseTabeViewController.h
//  NearbyPizza
//
//  Created by Rajkumar S on 10/10/15.
//  Copyright © 2015 Rajkumar S. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,weak) IBOutlet UITableView *tableView;

- (void)showLoading;
- (void)dismissLoading;

@end

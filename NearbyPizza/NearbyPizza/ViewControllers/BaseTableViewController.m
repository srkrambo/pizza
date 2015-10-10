//
//  BaseTabeViewController.m
//  NearbyPizza
//
//  Created by Rajkumar S on 10/10/15.
//  Copyright © 2015 Rajkumar S. All rights reserved.
//

#import "BaseTableViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showLoading{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)dismissLoading{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}


#pragma MARK - UITableViewDelegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

@end

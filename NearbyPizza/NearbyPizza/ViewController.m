//
//  ViewController.m
//  NearbyPizza
//
//  Created by Rajkumar S on 10/10/15.
//  Copyright © 2015 Rajkumar S. All rights reserved.
//

#import "ViewController.h"
#import "PizzaListModelService.h"
#import <CoreLocation/CoreLocation.h>
#import "PizzaListTableViewCell.h"
#import "VenueItem.h"
#import "DetailViewController.h"

@interface ViewController ()<CLLocationManagerDelegate>

@property (nonatomic, strong)CLLocationManager *locationManager;
@property (nonatomic, strong)NSArray *pizzaShops;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"PizzaListTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    self.title = @"NearBy Pizza Shops";
    [self fetchNearbyPizzaShops];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)fetchNearbyPizzaShops {
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined){
        [self.locationManager requestWhenInUseAuthorization];
    }
    else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse){
        [self.locationManager startUpdatingLocation];
        if(self.locationManager.location){
            self.locationManager.delegate = nil;
            [self.locationManager stopUpdatingLocation];
            [self showLoading];
            [PizzaListModelService fetchDataForLocation:self.locationManager.location withCompletion:^(NSArray *venueArray, NSError *error, NSHTTPURLResponse *response) {
                [self dismissLoading];
                self.pizzaShops = venueArray;
                [self.tableView reloadData];
            }];
        }

    }
    else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied){
        [[[UIAlertView alloc]initWithTitle:@"" message:@"Location Access denied. Please update your location privacy in settings." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil]show];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma MARK - UITableViewDelegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.pizzaShops.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    PizzaListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.backgroundColor = [UIColor clearColor];
    
    VenueItem *venueItem = [self.pizzaShops objectAtIndex:indexPath.row];
    [cell setCellWithVenueItem:venueItem];
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailVC"];
    detailVC.venueItem = [self.pizzaShops objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

#pragma MARK - Location Delegates

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    if (status >= kCLAuthorizationStatusAuthorizedWhenInUse ) {
        [self fetchNearbyPizzaShops];
    }
}

@end

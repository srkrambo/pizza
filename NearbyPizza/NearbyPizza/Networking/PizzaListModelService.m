//
//  PizzaListModelService.m
//  NearbyPizza
//
//  Created by Rajkumar S on 10/10/15.
//  Copyright © 2015 Rajkumar S. All rights reserved.
//

#import "PizzaListModelService.h"
#import "EnvironmentHelper.h"
#import "Constants.h"
#import <AFNetworking/AFNetworking.h>
#import "VenueResponseModel.h"
#import "PizzaShop.h"
#import "AppDelegate.h"

@implementation PizzaListModelService

+ (void)fetchDataForLocation:(CLLocation *) location withCompletion:(void (^)(NSArray *venueArray, NSError *error, NSHTTPURLResponse *response))completion{
    AFHTTPRequestOperationManager *manager = [EnvironmentHelper sharedInstance].manager;
    [manager GET:[NSString stringWithFormat:@"%@venues/search?client_id=%@&client_secret=%@&v=20130815&near=%@&query=pizza&limit=5",[EnvironmentHelper sharedInstance].hostURL, kFoursquareClientID, kFoursquareClientSecret, [NSString stringWithFormat:@"%f,%f",location.coordinate.latitude, location.coordinate.longitude]] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (completion) {
            NSError *error;

            VenueResponseModel *responseModel = [[VenueResponseModel alloc]initWithDictionary:responseObject error:&error];
            if (completion) {
                for (int i = 0 ; i<responseModel.response.venues.count; i++) {
                    VenueItem *item = [responseModel.response.venues objectAtIndex:i];
                    [PizzaListModelService addVenueToCoreData:item];
                }
                completion(responseModel.response.venues,error,operation.response);
                [[NSNotificationCenter defaultCenter]postNotificationName:kDataLoadedNotification object:nil];
            }
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
        }
        
    }];
}


+ (PizzaShop *)getVenueItemById:(NSString *)identifier {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:[NSEntityDescription entityForName:@"PizzaShop" inManagedObjectContext:[appDelegate managedObjectContext]]];
    [request setPredicate:[NSPredicate predicateWithFormat:@"identifier==%@",identifier]];
    NSError *error = nil;
    NSArray *result = [[appDelegate managedObjectContext]executeFetchRequest:request error:&error];
    if([result count]){
        return [result firstObject];
    }
    else {
        return nil;
    }
}

+ (NSArray *)fetchAllObjects{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:[NSEntityDescription entityForName:@"PizzaShop" inManagedObjectContext:[appDelegate managedObjectContext]]];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    [request setSortDescriptors:@[sortDescriptor]];
    NSError *error = nil;
    NSArray *result = [[appDelegate managedObjectContext]executeFetchRequest:request error:&error];
    return  result;
}

+ (void)addVenueToCoreData:(VenueItem *)item {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    PizzaShop * shop = [self getVenueItemById:item.identifier];
    if (shop){
        [[appDelegate managedObjectContext] deleteObject:shop];
    }
    
    shop = [NSEntityDescription insertNewObjectForEntityForName:@"PizzaShop" inManagedObjectContext:[appDelegate managedObjectContext]];
    shop.name = item.name;
    shop.identifier = item.identifier;
    if (item.location.formattedAddress.count) {
       shop.address = [item.location.formattedAddress firstObject];
    }
    else{
        shop.address = item.location.address;
    }
    shop.tipCount = item.stats.tipCount;
    NSError *error = nil;
    [[appDelegate managedObjectContext]save:&error];
}
@end

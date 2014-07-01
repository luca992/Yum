//
//  DWMVenuesTableViewController.h
//  Yum
//
//  Created by Binh Ly on 6/5/14.
//  Copyright (c) 2014 DW Morgan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "DWMVenueParser.h"
#import "DWMAppDelegate.h"


@interface DWMVenuesTableViewController : UITableViewController<CLLocationManagerDelegate>{
}
@property (nonatomic, strong)CLLocationManager * locationManager;
@property (nonatomic) BOOL useStoredData;
@property (nonatomic) NSArray *storedAllVenues;
//- (void)downloadVenues;
- (void)saveData;




@end

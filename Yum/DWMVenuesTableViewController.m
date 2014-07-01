//
//  DWMVenuesTableViewController.m
//  Yum
//
//  Created by Binh Ly on 6/5/14.
//  Copyright (c) 2014 DW Morgan. All rights reserved.
//

#import "DWMVenuesTableViewController.h"
#import <RestKit/RestKit.h>
#import "DWMVenue.h"

#define kCLIENTID @"KIAUETTBCTWAXXNP1D3MCYGZVIMRA5KZSMMJA4FYS23DL0AF"
#define kCLIENTSECRET @"LASVXNUSPBCE1IXOSGHVNZRNZ0CX304OT03NVKM3P3OKM2NT"
@interface DWMVenuesTableViewController (){
    DWMVenueParser* parser;

}
@property (nonatomic) NSURLSessionConfiguration *sessionConfig;
@property (nonatomic) NSURLSession *session;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationBar;
//@property (weak, nonatomic) NSMutableDictionary *venues;
@property (strong, nonatomic) NSArray *venuesRest;


@end

@implementation DWMVenuesTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView setAccessibilityLabel:@"Search List"];
    [self.tableView setIsAccessibilityElement:YES];
    
    if (!_useStoredData){
        [self startStandardUpdates];
        [self configureRestKit];
    }

    else
    {
        _venuesRest=_storedAllVenues;//[@"response"][@"venues"];
        [self.tableView reloadData];
    }
    
    

}

- (void)configureRestKit
{
    // initialize AFNetworking HTTPClient
    NSURL *baseURL = [NSURL URLWithString:@"https://api.foursquare.com"];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    
    // initialize RestKit
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    
    // setup object mappings
    RKObjectMapping *venueMapping = [RKObjectMapping mappingForClass:[DWMVenue class]];
    [venueMapping addAttributeMappingsFromArray:@[@"name"]];
    
    // register mappings with the provider using a response descriptor
    RKResponseDescriptor *responseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:venueMapping
                                                 method:RKRequestMethodGET
                                            pathPattern:@"/v2/venues/search"
                                                keyPath:@"response.venues"
                                            statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    [objectManager addResponseDescriptor:responseDescriptor];
}
- (void)loadVenues
{
    NSString *latLon = [NSString stringWithFormat:@"%f,%f",_locationManager.location.coordinate.latitude,_locationManager.location.coordinate.longitude];
    NSString *clientID = kCLIENTID;
    
    NSString *clientSecret = kCLIENTSECRET;
    
    NSDictionary *queryParams = @{@"ll" : latLon,
                                  @"client_id" : clientID,
                                  @"client_secret" : clientSecret,
                                  @"query" : self.navigationItem.title,
                                  @"v" : @"20140118"};
    
    [[RKObjectManager sharedManager] getObjectsAtPath:@"/v2/venues/search"
                                           parameters:queryParams
                                              success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                  _venuesRest = [NSArray arrayWithArray:mappingResult.array];
                                                  [self.tableView reloadData];
                                                  [self saveData];


                                              }
                                              failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                  NSLog(@"What do you mean by 'there is no coffee?': %@", error);
                                              }];

}
- (NSString *)deviceLocation {
    return [NSString stringWithFormat:@"latitude: %f longitude: %f", _locationManager.location.coordinate.latitude, _locationManager.location.coordinate.longitude];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
   /* if (_venues==nil)
        _venues = parser.allvenues[@"response"][@"venues"];
    return [_venues count];*/
    return _venuesRest.count;
}

#pragma mark - Intern Functions
/*
- (void)downloadVenues {
 
     Read about the foursquare venues API here https://developer.foursquare.com/start/search
     Sample Foursquare query string*/
    /*
    NSString *urlString = [NSString stringWithFormat:@"%@%f,%f%@%@", @"https://api.foursquare.com/v2/venues/search?client_id=KIAUETTBCTWAXXNP1D3MCYGZVIMRA5KZSMMJA4FYS23DL0AF&client_secret=LASVXNUSPBCE1IXOSGHVNZRNZ0CX304OT03NVKM3P3OKM2NT&v=20130815&ll=",_locationManager.location.coordinate.latitude, _locationManager.location.coordinate.longitude, @"&query=", self.navigationItem.title];
    
    NSLog(@"%@",urlString);
    //https://api.foursquare.com/v2/venues/search?client_id=KIAUETTBCTWAXXNP1D3MCYGZVIMRA5KZSMMJA4FYS23DL0AF&client_secret=LASVXNUSPBCE1IXOSGHVNZRNZ0CX304OT03NVKM3P3OKM2NT&v=20130815&ll=34.053901,-118.201739&query="
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
     
     Read about URL Sessions here https://developer.apple.com/library/ios/documentation/cocoa/Conceptual/URLLoadingSystem/Articles/UsingNSURLSession.html#//apple_ref/doc/uid/TP40013509-SW1
     
     */
/*
    self.sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    self.session = [NSURLSession sessionWithConfiguration: self.sessionConfig delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request
                                                 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                     [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                                                     
                                                     NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                                     
                                                     if (httpResponse.statusCode == 200) {
                                                         dispatch_async(dispatch_get_main_queue(), ^{
                                                             parser= [[DWMVenueParser alloc] initWithDictionaryData:data];
                                                             [self.tableView reloadData];
                                                            [self saveData];

                                                         });
                                                     } else {
                                                         //Prompt An Error
                                                     }
                                                 }];
    

    [task resume];
}

*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"VenueCell";
    UITableViewCell *cell = [[UITableViewCell alloc]
                             initWithStyle:UITableViewCellStyleSubtitle
                             reuseIdentifier:CellIdentifier];
    // Configure the cell...

    /*
    int i=0;
    for ( NSDictionary *theVenue in _venues )
    {
        if (indexPath.row==i)  cell.textLabel.text = theVenue[@"name"];
        i++;
    }*/
    
    DWMVenue *venue = _venuesRest[indexPath.row];
    cell.textLabel.text = venue.name;
    return cell;
}

- (void)startStandardUpdates
{
    // Create the location manager if this object does not
    // already have one.
    if (nil == _locationManager)
   _locationManager = [[CLLocationManager alloc] init];
    
   [_locationManager setDelegate:self];
    _locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    
    // Set a movement threshold for new events.
    _locationManager.distanceFilter = 500; // meters

    [_locationManager startUpdatingLocation];
}

// Delegate method from the CLLocationManagerDelegate protocol.
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    // If it's a relatively recent event, turn off updates to save power.
    CLLocation *newLocation = locations.lastObject;
    NSTimeInterval locationAge = -[newLocation.timestamp timeIntervalSinceNow];
    if (locationAge > 5.0) return;
    [self loadVenues];
    CLLocation* location = [locations lastObject];
    NSDate* eventDate = location.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    if (abs(howRecent) < 15.0) {
        // If the event is recent, do something with it.
        NSLog(@"latitude %+.6f, longitude %+.6f\n",
              location.coordinate.latitude,
              location.coordinate.longitude);
    }
    [_locationManager stopUpdatingLocation];

}

- (void) locationManager:(CLLocationManager *)manager
        didFailWithError:(NSError *)error
{
    NSLog(@"%@", @"Core location can't get a fix.");
}


- (void)saveData
{
    DWMAppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    NSManagedObject *newContact;
    newContact = [NSEntityDescription
                  insertNewObjectForEntityForName:@"SearchHistory"
                  inManagedObjectContext:context];
    [newContact setValue: [[self navigationBar] title] forKey:@"search"];
   // [newContact setValue: parser.allvenues[@"response"][@"venues"] forKey:@"searchData"];
    NSData *arrayData = [NSKeyedArchiver archivedDataWithRootObject:_venuesRest];

    [newContact setValue: arrayData forKey:@"searchData"];
    
    [newContact setValue:[NSDate date]  forKey:@"date"];
    
    NSError *error;
    [context save:&error];

    
}



@end

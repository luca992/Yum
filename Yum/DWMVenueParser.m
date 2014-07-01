//
//  DWMVenueParser.m
//  Yum
//
//  Created by Luca Spinazzola on 6/11/14.
//  Copyright (c) 2014 DW Morgan. All rights reserved.
//

#import "DWMVenueParser.h"

@implementation DWMVenueParser



-(instancetype) initWithDictionaryData:(NSData*)venuesData {
    
    self = [super init];
    if(self) {
        [self parseVenuesData:venuesData];
    }
    return self;
}



- (void)parseVenuesData:(NSData *)venuesData {
   // NSRange range = NSMakeRange(32, [venuesData length] - 33);
    //NSData *refinedData = [venuesData subdataWithRange:range];
    //NSString* test = [[NSString alloc] initWithData:refinedData encoding:NSUTF8StringEncoding];
    
    // Parse the NSData by converting it to JSON
    // Reload the table view with the names of the venues
    // NSLog(@"%@",test);
    // Good example of parsing JSON in iOS
    // http://www.intertech.com/Blog/basic-json-parsing-in-ios/
    
    // Your custom JSON parser is a good object to test
    NSError *error;
    _allvenues = [NSJSONSerialization
                  JSONObjectWithData:venuesData//refinedData
                  options:NSJSONReadingMutableContainers|NSJSONReadingAllowFragments
                  error:&error];
    
    if( error )
    {
        NSLog(@"%@", [error localizedDescription]);
    }
    /*else {
     NSArray *venues = _allvenues[@"venues"];
     for ( NSDictionary *theVenue in venues )
     {
     NSLog(@"----");
     NSLog(@"name: %@", theVenue[@"name"] );
     NSLog(@"----");
     }
     }*/
    
    
}

@end

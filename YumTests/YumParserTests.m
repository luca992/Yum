//
//  YumParserTests.m
//  Yum
//
//  Created by Luca Spinazzola on 6/11/14.
//  Copyright (c) 2014 DW Morgan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DWMVenueParser.h"

@interface YumParserTests : XCTestCase
{
    NSData *jsonResponse;
    DWMVenueParser *parser; }

@end

@implementation YumParserTests

- (void)setUp
{
    [super setUp];
    // The test data should only be available in the test bundle
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    // Get the path to your test data
    NSString *filePath = [bundle pathForResource:@"VenueData" ofType:@"json" ];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    // Create dictionary
    parser = [[DWMVenueParser alloc] initWithDictionaryData:data];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFirstVenueNameAndIdCorrect
{
    NSArray *venues = parser.allvenues[@"response"][@"venues"];

    for(NSDictionary *theVenue in venues){
        XCTAssertEqualObjects(theVenue[@"name"], @"Pizza", @"The first venue name in json data should be 'Pizza'");
        XCTAssertEqualObjects(theVenue[@"id"], @"4f321e9219836c91c7b7e2c8", @"The first venue id in json data should be '4f321e9219836c91c7b7e2c8'");
        break;
    }
}

- (void)testLastVenueNameAndIdCorrect
{
    NSArray *venues = parser.allvenues[@"response"][@"venues"];
    NSString* name;
    NSString* idValue;
    for(NSDictionary *theVenue in venues){
        name=theVenue[@"name"];
        idValue=theVenue[@"id"];
    }
    XCTAssertEqualObjects(name, @"Domino's Pizza", @"The last venue name in json data should be 'Pizza Place'");
    XCTAssertEqualObjects(idValue, @"4e4d2e84bd413c4cc66f3b5f", @"The first venue id in json data should be '4f321e9219836c91c7b7e2c8'");

}

@end

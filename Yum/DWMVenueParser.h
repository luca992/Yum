//
//  DWMVenueParser.h
//  Yum
//
//  Created by Luca Spinazzola on 6/11/14.
//  Copyright (c) 2014 DW Morgan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DWMVenueParser : NSObject
@property (nonatomic) NSArray *venus;

@property (nonatomic) NSMutableDictionary *allvenues;

-(instancetype) initWithDictionaryData:(NSData*)venuesData;
- (void)parseVenuesData:(NSData *)venuesData;

@end

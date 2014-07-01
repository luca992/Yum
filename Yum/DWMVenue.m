//
//  DWMVenue.m
//  Yum
//
//  Created by Luca Spinazzola on 6/27/14.
//  Copyright (c) 2014 DW Morgan. All rights reserved.
//

#import "DWMVenue.h"

#define kNameKey       @"Title"
#define kRatingKey      @"Rating"

@implementation DWMVenue



- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_name forKey:kNameKey];
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        _name = [coder decodeObjectForKey:kNameKey];

    }
    return self;
}
@end

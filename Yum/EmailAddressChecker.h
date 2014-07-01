//
//  EmailAddressChecker.h
//  Yum
//
//  Created by Luca Spinazzola on 6/6/14.
//  Copyright (c) 2014 DW Morgan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmailAddressChecker : NSObject
@property (nonatomic) NSString* inputEmailAddress;
@property BOOL validEmailAddress;
-(instancetype) initWithAmountString:(NSString*)emailAddress;
@end

//
//  PhoneNumberChecker.h
//  Yum
//
//  Created by Luca Spinazzola on 6/6/14.
//  Copyright (c) 2014 DW Morgan. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PhoneNumberChecker : NSObject
@property (nonatomic) NSString* inputNumber;
@property BOOL validPhoneNumber;
@property BOOL phoneNumberNil;
-(instancetype) initWithAmountString:(NSString*)phoneNumber;


@end

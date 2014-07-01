//
//  PhoneNumberChecker.m
//  Yum
//
//  Created by Luca Spinazzola on 6/6/14.
//  Copyright (c) 2014 DW Morgan. All rights reserved.
//

#import "PhoneNumberChecker.h"

@implementation PhoneNumberChecker

-(instancetype) initWithAmountString:(NSString*)phoneNumber {
    
    self = [super init];
    if(self) {
        _inputNumber =  phoneNumber;
        _validPhoneNumber=false;
        [self verifyNumber];
    }
    return self;
}


- (void)verifyNumber {
    NSScanner *scanner = [NSScanner scannerWithString:_inputNumber];
    BOOL isNumeric = [scanner scanInteger:nil] && [scanner isAtEnd];
    if ((_inputNumber.length != 10 && _inputNumber.length != 0)
        || (!isNumeric&& _inputNumber.length != 0)){
        
        _validPhoneNumber= false;
    }
    else _validPhoneNumber= true;
    
    if (_inputNumber.length == 0)
        _phoneNumberNil=true;
    else _phoneNumberNil=false;
    
}


@end

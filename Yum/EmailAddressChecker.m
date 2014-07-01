//
//  EmailAddressChecker.m
//  Yum
//
//  Created by Luca Spinazzola on 6/6/14.
//  Copyright (c) 2014 DW Morgan. All rights reserved.
//

#import "EmailAddressChecker.h"

@implementation EmailAddressChecker
-(instancetype) initWithAmountString:(NSString*)emailAddress {
    
    self = [super init];
    if(self) {
        _inputEmailAddress =  emailAddress;
        _validEmailAddress=false;
        [self verifyEmail];
    }
    return self;
}

- (void)verifyEmail {
    NSString *regexForEmailAddress = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailValidation = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regexForEmailAddress];
    if (![emailValidation evaluateWithObject:_inputEmailAddress] && _inputEmailAddress.length != 0){
        
        _validEmailAddress= false;
    }
    else _validEmailAddress= true;
    
    
}

@end



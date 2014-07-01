//
//  FoodChecker.m
//  Yum
//
//  Created by Luca Spinazzola on 6/6/14.
//  Copyright (c) 2014 DW Morgan. All rights reserved.
//

#import "FoodChecker.h"

@implementation FoodChecker
-(instancetype) initWithAmountString:(NSString*)food {
    
    self = [super init];
    if(self) {
        _inputFood =  food;
        _validFood = false;
        [self verifyFood];
    }
    return self;
}


- (void)verifyFood {
    if ([_inputFood isEqual:@""]){
        _validFood = false;
    }
    else _validFood = true;
    
}
@end

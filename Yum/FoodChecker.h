//
//  FoodChecker.h
//  Yum
//
//  Created by Luca Spinazzola on 6/6/14.
//  Copyright (c) 2014 DW Morgan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodChecker : NSObject
@property (nonatomic) NSString* inputFood;
@property BOOL validFood;
-(instancetype) initWithAmountString:(NSString*)food;
@end

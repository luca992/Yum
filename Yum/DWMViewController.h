//
//  DWMViewController.h
//  Yum
//
//  Created by Binh Ly on 6/5/14.
//  Copyright (c) 2014 DW Morgan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhoneNumberChecker.h"
@interface DWMViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (nonatomic) IBOutlet UITextField *emailTextField;
@property (nonatomic) IBOutlet UITextField *foodTextField;
@property (nonatomic) IBOutlet UIButton *findFoodButton;
@property BOOL validPhoneNumber;
@property BOOL validEmailAddress;
@property BOOL validFood;
@end

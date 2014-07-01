//
//  DWMViewController.m
//  Yum
//
//  Created by Binh Ly on 6/5/14.
//  Copyright (c) 2014 DW Morgan. All rights reserved.
//

#import "DWMViewController.h"
#import "PhoneNumberChecker.h"
#import "EmailAddressChecker.h"
#import "FoodChecker.h"
#import "DWMVenuesTableViewController.h"

@interface DWMViewController ()

@end

@implementation DWMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _validPhoneNumber=false;
    _validEmailAddress=false;
    _validFood=false;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)verifyNumber:(id)sender {
    PhoneNumberChecker * numberChecker;
    numberChecker= [[PhoneNumberChecker alloc] initWithAmountString:_phoneNumberTextField.text];

    if (!numberChecker.validPhoneNumber){
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Input Error"
                                message:@"You must enter a 10-digit phone number."
                                delegate:nil
                                cancelButtonTitle:@"OK"
                                otherButtonTitles:nil];
        
        [message show];
        _validPhoneNumber=false;
        _phoneNumberTextField.text=nil;
    }
    else _validPhoneNumber=true;
        
}
- (IBAction)verifyEmail:(id)sender {
    EmailAddressChecker * emailChecker;
    emailChecker= [[EmailAddressChecker alloc] initWithAmountString:_emailTextField.text];
    _emailTextField.delegate = self;

    if (!emailChecker.validEmailAddress){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Input Error"
                                message:@"You must enter a vaild email address."
                                delegate:nil
                                cancelButtonTitle:@"OK"
                                otherButtonTitles:nil];
        
        [message show];
        _validEmailAddress=false;
        _emailTextField.text=nil;
    }
    else _validEmailAddress=true;
}
- (IBAction)verifyFood:(id)sender {
    FoodChecker * foodChecker;
    foodChecker= [[FoodChecker alloc] initWithAmountString:_foodTextField.text];
    _foodTextField.delegate = self;


    if (!foodChecker.validFood){
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Input Error"
                                message:@"You must enter some food"
                                delegate:nil
                                cancelButtonTitle:@"OK"
                                otherButtonTitles:nil];
        
        [message show];
        _validFood=false;
        
    }
    else _validFood=true;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    UIButton *button = (UIButton*)sender;
    if (button.tag ==0){
        if ( _validFood && _validPhoneNumber && _validEmailAddress && ![_phoneNumberTextField.text isEqual:@""] && ![_emailTextField.text isEqual:@""])
        return YES;
        else return NO;
    }
    else
        return YES;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button.tag ==0){
    DWMVenuesTableViewController *tableViewController = segue.destinationViewController;
    tableViewController.navigationItem.title=_foodTextField.text;
    tableViewController.useStoredData=false;
    }
    
}

@end

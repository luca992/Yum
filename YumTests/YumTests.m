//
//  YumTests.m
//  YumTests
//
//  Created by Binh Ly on 6/5/14.
//  Copyright (c) 2014 DW Morgan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EmailAddressChecker.h"
#import "FoodChecker.h"
#import "PhoneNumberChecker.h"


@interface YumTests : XCTestCase{
    PhoneNumberChecker * numberChecker;
    EmailAddressChecker * emailChecker;
    FoodChecker* foodChecker;
}

@end

@implementation YumTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}



- (void)testYumPhoneNumberValidMakes_validPhoneNumber_true
{
    numberChecker= [[PhoneNumberChecker alloc] initWithAmountString:@"1234567890"];
    XCTAssertTrue((numberChecker.validPhoneNumber && [numberChecker.inputNumber isEqual:@"1234567890"]), @"numberChecker.validPhoneNumber should be assigned true when numberChecker.inputNumber contains valid number");
}
- (void)testYumPhoneNumberNilMakes_validPhoneNumber_true
{
    numberChecker= [[PhoneNumberChecker alloc] initWithAmountString:@""];
    XCTAssertTrue((numberChecker.validPhoneNumber && [numberChecker.inputNumber isEqual:@""]), @"numberChecker.validPhoneNumber should be assigned true when numberChecker.inputNumber contains nil to avoid unnecessary alert");
}

- (void)testYumPhoneNumberTooLongMakes_validPhoneNumber_false
{
    numberChecker= [[PhoneNumberChecker alloc] initWithAmountString:@"12345678901"];
    XCTAssertTrue([numberChecker.inputNumber isEqual:@"12345678901"], @"numberChecker.inputNumber should equal string used with init");

    XCTAssertFalse((numberChecker.validPhoneNumber), @"numberChecker.validPhoneNumber should be assigned false when numberChecker.inputNumber contains invalid long number");
}
- (void)testYumPhoneNumberTooShortMakes_validPhoneNumber_false
{
    numberChecker= [[PhoneNumberChecker alloc] initWithAmountString:@"123456789"];
    XCTAssertTrue([numberChecker.inputNumber isEqual:@"123456789"], @"numberChecker.inputNumber should equal string used with init");
    XCTAssertFalse(numberChecker.validPhoneNumber, @"numberChecker.validPhoneNumber should be assigned false when numberChecker.inputNumber contains invalid short number");
}
- (void)testYumPhoneNumberContainsLetterMakes_validPhoneNumber_false
{
    numberChecker= [[PhoneNumberChecker alloc] initWithAmountString:@"12345678G9"];
    XCTAssertTrue([numberChecker.inputNumber isEqual:@"12345678G9"], @"numberChecker.inputNumber should equal string used with init");
    XCTAssertFalse(numberChecker.validPhoneNumber, @"numberChecker.validPhoneNumber should be assigned false when numberChecker.inputNumber contains letters");
}


- (void)testYumEmailAddressValidMakes_validAddress_true
{
    emailChecker= [[EmailAddressChecker alloc] initWithAmountString:@"aaa@bbb.com"];
    XCTAssertTrue((emailChecker.validEmailAddress && [emailChecker.inputEmailAddress isEqual:@"aaa@bbb.com"]), @"emailChecker.validEmailAddress should be assigned true when emailChecker.inputEmail contains valid address");
}


- (void)testYumEmailAddressinValid1Makes_validAddress_false
{
    emailChecker= [[EmailAddressChecker alloc] initWithAmountString:@"aaa@bbbcom"];
    XCTAssertTrue([emailChecker.inputEmailAddress isEqual: @"aaa@bbbcom"], @"emailChecker.inputEmailAddress should equal string used with init");
    XCTAssertFalse(emailChecker.validEmailAddress, @"emailChecker.validEmailAddress should be assigned false when emailChecker.inputEmail contains invalid address");
}

- (void)testYumEmailAddressinValid2Makes_validAddress_false
{
    emailChecker= [[EmailAddressChecker alloc] initWithAmountString:@"aaabbb.com"];
    XCTAssertTrue([emailChecker.inputEmailAddress isEqual: @"aaabbb.com"], @"emailChecker.inputEmailAddress should equal string used with init");
    XCTAssertFalse(emailChecker.validEmailAddress, @"emailChecker.validEmailAddress should be assigned false when emailChecker.inputEmail contains invalid address");
}

- (void)testYumEmailAddressinValid3Makes_validAddress_false
{
    emailChecker= [[EmailAddressChecker alloc] initWithAmountString:@"aaabbbcom"];
    XCTAssertTrue([emailChecker.inputEmailAddress isEqual: @"aaabbbcom"], @"emailChecker.inputEmailAddress should equal string used with init");
    XCTAssertFalse(emailChecker.validEmailAddress, @"emailChecker.validEmailAddress should be assigned false when emailChecker.inputEmail contains invalid address");
}

- (void)testYumEmailAddressinValid4Makes_validAddress_false
{
    emailChecker= [[EmailAddressChecker alloc] initWithAmountString:@"aaabbbco.m"];
    XCTAssertTrue([emailChecker.inputEmailAddress isEqual: @"aaabbbco.m"], @"emailChecker.inputEmailAddress should equal string used with init");
    XCTAssertFalse(emailChecker.validEmailAddress, @"emailChecker.validEmailAddress should be assigned false when emailChecker.inputEmail contains invalid address");
}
- (void)testYumFoodValidMakes_validFood_true
{
    foodChecker= [[FoodChecker alloc] initWithAmountString:@"Pizza"];
    XCTAssertTrue([foodChecker.inputFood isEqual: @"Pizza"], @"foodChecker.inputFood should equal string used with init");
    XCTAssertTrue(foodChecker.validFood, @"foodChecker.validFood should be assigned true when foodChecker.inputFood contains valid food");
}

- (void)testYumFoodNilMakes_validFood_false
{
    foodChecker= [[FoodChecker alloc] initWithAmountString:@""];
    XCTAssertTrue([foodChecker.inputFood isEqual: @""], @"foodChecker.inputFood should equal string used with init");
    XCTAssertFalse(foodChecker.validFood, @"foodChecker.validFood should be assigned false when foodChecker.inputFood contains invalid food");
}


@end

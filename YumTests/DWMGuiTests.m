//
//  DWMGuiTests.m
//  Yum
//
//  Created by Luca Spinazzola on 6/25/14.
//  Copyright (c) 2014 DW Morgan. All rights reserved.
//

#import "DWMGuiTests.h"
#import "KIFUITestActor.h"
#import "UIApplication-KIFAdditions.h"
#import "UIAccessibilityElement-KIFAdditions.h"
#import "KIFTestStepValidation.h"
#import "Kif.h"
#import <XCTest/XCTest.h>


@implementation DWMGuiTests
- (void)beforeEach
{
}

- (void)afterEach
{
    
}

- (void)test001NewSearch
{
    [tester clearTextFromAndThenEnterText:@"4017413028"
           intoViewWithAccessibilityLabel:@"Phone Number"];
    [tester clearTextFromAndThenEnterText:@"Luca.spinazzola@dwmorgan.com"
           intoViewWithAccessibilityLabel:@"Email"];
    [tester clearTextFromAndThenEnterText:@"Pizza"
           intoViewWithAccessibilityLabel:@"Food"];
    
    
    [tester tapViewWithAccessibilityLabel:@"Search Button"];
    [tester waitForViewWithAccessibilityLabel:@"Search List"];
    [tester waitForTimeInterval:1];
    [tester tapViewWithAccessibilityLabel:@"Yum"];
    
    
    
}

- (void)test002NewSearch
{
    
    [tester clearTextFromAndThenEnterText:@"6666666666"
           intoViewWithAccessibilityLabel:@"Phone Number"];
    [tester clearTextFromAndThenEnterText:@"test2@dwmorgan.com"
           intoViewWithAccessibilityLabel:@"Email"];
    [tester clearTextFromAndThenEnterText:@"Pasta"
           intoViewWithAccessibilityLabel:@"Food"];
    
    
    [tester tapViewWithAccessibilityLabel:@"Search Button"];
    [tester waitForViewWithAccessibilityLabel:@"Search List"];
    [tester waitForTimeInterval:1];
    [tester tapViewWithAccessibilityLabel:@"Yum"];
    
    
}
- (void)test003NewSearch
{
    
    [tester clearTextFromAndThenEnterText:@"1111111111"
           intoViewWithAccessibilityLabel:@"Phone Number"];
    [tester clearTextFromAndThenEnterText:@"test3@dwmorgan.com"
           intoViewWithAccessibilityLabel:@"Email"];
    [tester clearTextFromAndThenEnterText:@"Chinese"
           intoViewWithAccessibilityLabel:@"Food"];
    
    
    [tester tapViewWithAccessibilityLabel:@"Search Button"];
    [tester waitForViewWithAccessibilityLabel:@"Search List"];
    [tester waitForTimeInterval:1];
    [tester tapViewWithAccessibilityLabel:@"Yum"];
    
    
}

- (void)test004NewSearch
{
    
    [tester clearTextFromAndThenEnterText:@"2222222222"
           intoViewWithAccessibilityLabel:@"Phone Number"];
    [tester clearTextFromAndThenEnterText:@"test4@dwmorgan.com"
           intoViewWithAccessibilityLabel:@"Email"];
    [tester clearTextFromAndThenEnterText:@"Sushi"
           intoViewWithAccessibilityLabel:@"Food"];
    
    
    [tester tapViewWithAccessibilityLabel:@"Search Button"];
    [tester waitForViewWithAccessibilityLabel:@"Search List"];
    [tester waitForTimeInterval:1];
    [tester tapViewWithAccessibilityLabel:@"Yum"];
    
    
}

- (void)test005StoredSearch
{
    
    
    
    [tester tapViewWithAccessibilityLabel:@"History"];
    [tester waitForViewWithAccessibilityLabel:@"History List"];
    [tester tapViewWithAccessibilityLabel:@"History List"];
    [tester tapViewWithAccessibilityLabel:@"Back"];
    [tester tapViewWithAccessibilityLabel:@"Yum"];


    
    
}

- (void)test006SwipeToDeleteHistoryItem
{
    // 1
    [tester tapViewWithAccessibilityLabel:@"History"];
    
    // 2
    UITableView *tableView = (UITableView *)[tester waitForViewWithAccessibilityLabel:@"History List"];
    NSInteger originalHistoryCount = [tableView numberOfRowsInSection:0];
    XCTAssertTrue(originalHistoryCount > 0, @"There should be at least 1 history item!");
    
    // 3
    [tester swipeViewWithAccessibilityLabel:@"Section 0 Row 0" inDirection:KIFSwipeDirectionLeft];
    [tester tapViewWithAccessibilityLabel:@"Delete"];
    

    
    // 4
    [tester waitForTimeInterval:1];
    NSInteger currentHistoryCount = [tableView numberOfRowsInSection:0];
    XCTAssertTrue(currentHistoryCount == originalHistoryCount - 1,
                 @"The history item was not deleted :[");
    [tester tapViewWithAccessibilityLabel:@"Yum"];
    
}
- (void)test007SwipeToDeleteAllHistoryItems
{
    // 1
    [tester tapViewWithAccessibilityLabel:@"History"];
    
    // 2
    UITableView *tableView = (UITableView *)[tester waitForViewWithAccessibilityLabel:@"History List"];
    NSInteger originalHistoryCount = [tableView numberOfRowsInSection:0];
    XCTAssertTrue(originalHistoryCount > 0, @"There should be at least 1 history item!");
    
    // 3
    for (int i=0; i< originalHistoryCount; i++){
    [tester swipeViewWithAccessibilityLabel:[NSString stringWithFormat:@"Section 0 Row %d",i] inDirection:KIFSwipeDirectionLeft];
    [tester tapViewWithAccessibilityLabel:@"Delete"];
    }
    
    
    
    // 4
    NSInteger currentHistoryCount = [tableView numberOfRowsInSection:0];
    XCTAssertTrue(currentHistoryCount == 0,
                  @"All history items were not deleted :[");
    [tester tapViewWithAccessibilityLabel:@"Yum"];

}

- (void)test008NewSearch
{
    [tester clearTextFromAndThenEnterText:@"1234567890"
           intoViewWithAccessibilityLabel:@"Phone Number"];
    [tester clearTextFromAndThenEnterText:@"test8@dwmorgan.com"
           intoViewWithAccessibilityLabel:@"Email"];
    [tester clearTextFromAndThenEnterText:@"Mexican"
           intoViewWithAccessibilityLabel:@"Food"];
    
    
    [tester tapViewWithAccessibilityLabel:@"Search Button"];
    [tester waitForViewWithAccessibilityLabel:@"Search List"];
    [tester waitForTimeInterval:1];
    UITableView *searchTableView = (UITableView *)[tester waitForViewWithAccessibilityLabel:@"Search List"];
    NSInteger originalSearchCount = [searchTableView numberOfRowsInSection:0];
    NSString *originalfirstItem=[searchTableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]].textLabel.text;
    [tester tapViewWithAccessibilityLabel:@"Yum"];
    [tester tapViewWithAccessibilityLabel:@"History"];
    UITableView *historyTableView = (UITableView *)[tester waitForViewWithAccessibilityLabel:@"History List"];
    
    NSInteger originalHistoryCount = [historyTableView numberOfRowsInSection:0];
    XCTAssertTrue(originalHistoryCount > 0, @"There should be at least 1 history item!");
    
    [tester tapViewWithAccessibilityLabel:@"Section 0 Row 0"];
    
    UITableView *newSearchTableView = (UITableView *)[tester waitForViewWithAccessibilityLabel:@"Search List"];
    NSInteger newSearchCount = [newSearchTableView numberOfRowsInSection:0];
    NSString *newFirstItem=[newSearchTableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]].textLabel.text;
    XCTAssertEqual(newSearchCount, originalSearchCount, @"There is not the same amount of table cells in last stored search as there actually were in the last search");
    XCTAssertEqualObjects(newFirstItem, originalfirstItem, @"There last stored search's first cell's text is not the same as the actual text of last search");

    
    

    
    
    
    
}
@end

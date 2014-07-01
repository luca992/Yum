//
//  DWMSearchHistoryTableViewController.h
//  Yum
//
//  Created by Luca Spinazzola on 6/23/14.
//  Copyright (c) 2014 DW Morgan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DWMAppDelegate.h"


@interface DWMSearchHistoryTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;


@end

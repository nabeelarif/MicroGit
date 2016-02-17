//
//  RepoTableViewControllerTest.m
//  Micro Git
//
//  Created by Nabeel Arif on 2/18/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RepositoriesTableViewController.h"

@interface RepoTableViewControllerTest : XCTestCase
@property (nonatomic,strong) RepositoriesTableViewController *repoVC;
@end

@implementation RepoTableViewControllerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *nav= [storyboard instantiateInitialViewController];
    _repoVC = (RepositoriesTableViewController*)nav.viewControllers.firstObject;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
- (void)testViewControllerExists {
    XCTAssertNotNil([_repoVC view], @"RepositoriesTableViewController should contain a view");
    
}
- (void)testInitialViewControllerisRepositoriesTableViewController {
    XCTAssert([_repoVC isKindOfClass:[RepositoriesTableViewController class]], @"RepositoriesTableViewController should contain a view");
}

@end

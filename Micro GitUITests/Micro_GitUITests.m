//
//  Micro_GitUITests.m
//  Micro GitUITests
//
//  Created by Home on 2/11/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface Micro_GitUITests : XCTestCase

@end

@implementation Micro_GitUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testUIElements
{
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationFaceUp;
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationPortrait;
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *objectiveCNavigationBar = app.navigationBars[@"Objective-c"];
    XCTAssert(objectiveCNavigationBar.exists, @"Nav bar with Objective-c title Exists");
    XCUIElement *button =objectiveCNavigationBar.buttons[@"Search"];
    XCTAssert(button.exists, @"Button Exists");
}
-(void)testTapSearchOpensSearchBar{
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationFaceUp;
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationPortrait;
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *objectiveCNavigationBar = app.navigationBars[@"Objective-c"];
    XCUIElement *enterLanguageSearchField = objectiveCNavigationBar.searchFields[@"Enter language ..."];
    XCTAssert(enterLanguageSearchField.exists==NO, @"Search Bar do not Exists");
    [objectiveCNavigationBar.buttons[@"Search"] tap];
    enterLanguageSearchField = objectiveCNavigationBar.searchFields[@"Enter language ..."];
    XCTAssert(enterLanguageSearchField.exists, @"Search Bar Exists");
}
-(void)testSearchingChangesTitleOfNavigationBar{
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationFaceUp;
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationFaceUp;
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *objectiveCNavigationBar = app.navigationBars[@"Objective-c"];
    [objectiveCNavigationBar.buttons[@"Search"] tap];
    
    XCUIElement *enterLanguageSearchField = objectiveCNavigationBar.searchFields[@"Enter language ..."];
    [enterLanguageSearchField.buttons[@"Clear text"] tap];
    [enterLanguageSearchField typeText:@"Swift"];
    
    XCUIElement *searchButton = app.buttons[@"Search"];
    [searchButton tap];
    
    XCUIElement *swiftNavigationBar = app.navigationBars[@"Swift"];
    XCTAssert(swiftNavigationBar.exists,@"Title is changed to Swift ");
    
}
-(void)testAppIsSearchingOnLaunch{
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationFaceUp;
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationFaceUp;
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *progressIndicator = app.tables[@"In progress"];
    XCTAssert(progressIndicator.exists,@"Progress Indicator is available");
    
}
@end

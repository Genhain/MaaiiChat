//
//  ChatBarTests.m
//  MaaiiChat
//
//  Created by Ben on 01/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CViewController.h"
#import "CUIChatBar.h"

@interface ChatBarTests : XCTestCase

@end

@implementation ChatBarTests

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

- (void)testChatBarShouldBeConnected
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    
    CViewController *CVC = [storyBoard instantiateViewControllerWithIdentifier:@"Chat"];
    [CVC view];
    
    CUIChatBar *SUT = [CVC chatBar];
    
    XCTAssertNotNil(SUT);
}

- (void)testChatBarTextFieldNotNil
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    
    CViewController *CVC = [storyBoard instantiateViewControllerWithIdentifier:@"Chat"];
    [CVC view];
    
    CUIChatBar *SUT = [CVC chatBar];
    
    XCTAssertNotNil([SUT textField]);
}


@end


@interface ChatBarTextFieldTests : XCTestCase
{
    UITextField *SUT;
}
@end

@implementation ChatBarTextFieldTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    
    CViewController *CVC = [storyBoard instantiateViewControllerWithIdentifier:@"Chat"];
    [CVC view];
    
    SUT = [[CVC chatBar] textField];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//Should Move this test to elsewhere
- (void)testInitialChatTextField_ShouldBeEmpty
{
    XCTAssertEqual([SUT text].length, 0, @"Start up text field is not empty");
}

//Should Move this test to elsewhere
- (void)testInitialChatTextFieldPlaceHolder_ShouldContainText
{
    XCTAssertEqualObjects([SUT placeholder], @"Type here...", @"Placeholder is not set");
}

- (void)testChatTextField_Delegate_NotNil
{
    id<UITextFieldDelegate> delegate = [SUT delegate];
    XCTAssertNotNil(delegate);
}

@end

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
#import "CUITableViewChatCell.h"
#import "CUIChatTableView.h"
#import "UITableView+IndexPathFunctions.h"
#import "CChatTableViewDelegate.h"
#import "FileIOManager.h"

@interface ChatBarTests : XCTestCase
{
    CUIChatBar *SUT;
}

@end

@implementation ChatBarTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    
    CViewController *CVC = [storyBoard instantiateViewControllerWithIdentifier:@"Chat"];
    [CVC view];
    
     SUT = [CVC chatBar];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testChatBarShouldBeConnected
{
    XCTAssertNotNil(SUT);
}

- (void)testChatBarMessageToSendNotNil
{
    XCTAssertNotNil([SUT message]);
}

- (void)testChatBarMessageToSendIntiallyEmpty
{
    XCTAssertEqual([SUT message].length,0);
}

- (void)testChatBarTextFieldNotNil
{
    XCTAssertNotNil([SUT textField]);
}

- (void)testChatBarButtonShouldBeConnected
{
    XCTAssertNotNil([SUT sendButton]);
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

@interface ChatBarSendButtonTests : XCTestCase
{
    
    CViewController *CVC;
    UIButton *SUT;
}
@end

@implementation ChatBarSendButtonTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    
    CVC = [storyBoard instantiateViewControllerWithIdentifier:@"Chat"];
    [CVC view];
    
    SUT = [[CVC chatBar] sendButton];
    
    CChatTableViewDelegate *mockChatTableViewDelegate = [CChatTableViewDelegate Create:[CVC chatTableView] chatLogID:@"testFile"];
    [CVC setChatTableViewDelegate:mockChatTableViewDelegate];
}

- (void)tearDown
{
    NSError *error;
    [FileIOManager DeleteFile:@"testFile" error:&error];
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//Should Move this test to elsewhere
- (void)testSendButtonAction
{
    XCTAssertNotEqual([SUT actionsForTarget:CVC forControlEvent:UIControlEventTouchUpInside].count, 0);
}

- (void)testActionGetStringFromTextField
{
    //given
    NSString *string = @"hello";
    [[CVC chatBar]textField].text = string;
    
    //when
    [CVC sendMessage:nil];
    
    //then
    XCTAssertEqualObjects([[CVC chatBar]message], string);
}

- (void)testActionSetsCellMessageStringTesting
{
    //given
    NSString *string = @"testing";
    [[CVC chatBar]textField].text = string;
    
    //when
    [CVC sendMessage:nil];
    NSIndexPath *path = [[CVC chatTableView] indexPathForLastRow];
    CUITableViewChatCell *cell = (CUITableViewChatCell*)[[CVC chatTableView] cellForRowAtIndexPath:path];
    
    //then
    XCTAssertEqualObjects([cell messageLabel].text, @"testing");
}

- (void)testActionSetsCellMessageStringTestingTwo
{
    //given
    NSString *string = @"testingTwo";
    [[CVC chatBar]textField].text = string;
    
    //when
    [CVC sendMessage:nil];
    NSIndexPath *path = [[CVC chatTableView] indexPathForLastRow];
    CUITableViewChatCell *cell = (CUITableViewChatCell*)[[CVC chatTableView] cellForRowAtIndexPath:path];
    
    //then
    XCTAssertEqualObjects([cell messageLabel].text, @"testingTwo");
}


@end

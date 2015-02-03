//
//  ChatScrollViewTests.m
//  MaaiiChat
//
//  Created by Ben on 31/01/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CViewController.h"
#import "CChatTableViewEventHandler.h"
#import "CUITableViewChatCell.h"
#import "UIView+NibLoading.h"
#import "CChatTableViewDelegate.h"
#import "CUIChatTableView.h"
#import "CMessageInfo.h"
#import "UITableView+IndexPathFunctions.h"
#import "FileIOManager.h"

@interface ChatTableViewTests : XCTestCase
{
    CChatTableViewEventHandler *SUT;
}

@end

@implementation ChatTableViewTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    
    CViewController *CVC = [storyBoard instantiateViewControllerWithIdentifier:@"Chat"];
    [CVC view];
    
    SUT = [CVC chatTableViewEventHandler];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testScrollViewShouldBeConnected
{
    XCTAssertNotNil([SUT tableView]);
}

- (void)testClassDoesRespondToKeyboardWillAppearNotification
{
    SEL selector = NSSelectorFromString(@"keyboardWillShow:");
    XCTAssertTrue([SUT respondsToSelector:selector]);
}

- (void)testNotificationInfoIsNotNil
{
    [[NSNotificationCenter defaultCenter] postNotificationName:UIKeyboardWillShowNotification object:nil userInfo:@{ UIKeyboardFrameBeginUserInfoKey : [NSValue valueWithCGRect:CGRectMake(0, 0, 0, 0)] }];
    XCTAssertNotNil([SUT notificationInfo]);
}

- (void)testNotificationInfoKeyboardValueIsNotNill
{
    [[NSNotificationCenter defaultCenter] postNotificationName:UIKeyboardWillShowNotification
                                                        object:nil
     userInfo:@{ UIKeyboardFrameBeginUserInfoKey : [NSValue valueWithCGRect:CGRectMake(0, 0, 0, 0)] }];
    
    id object = [[SUT notificationInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey];
    XCTAssertNotNil(object);
}

- (void)testScrollViewShouldScrollUpOnKeyboardWillAppear
{
    CGRect scrollViewIntial = [[SUT tableView] frame];
    CGRect keyboardFrame = CGRectMake(0, 0, 0, 30);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:UIKeyboardWillShowNotification
                                                        object:nil
                                                      userInfo:@{ UIKeyboardFrameBeginUserInfoKey : [NSValue valueWithCGRect:keyboardFrame] }];
    
    XCTAssertEqual([[SUT tableView]frame].size.height, scrollViewIntial.size.height-30);
    XCTAssertEqual([[SUT tableView]frame].origin.y, 0);
}

- (void)testScrollViewShouldScrollContentToBottomOnKeyboardWillAppear
{
    CGRect keyboardFrame = CGRectMake(0, 0, 0, 30);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:UIKeyboardWillShowNotification
                                                        object:nil
                                                      userInfo:@{ UIKeyboardFrameBeginUserInfoKey : [NSValue valueWithCGRect:keyboardFrame] }];
    
    XCTAssertEqual([[SUT tableView]contentOffset].y,[[SUT tableView] contentSize].height-[[SUT tableView]bounds].size.height);
}


@end

@interface ChatTableCustomCell : XCTestCase
{
    
}

@end

@implementation ChatTableCustomCell

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

-(void)testNameLabelShouldBeConnected
{
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
//    
//    CViewController *CVC = [storyBoard instantiateViewControllerWithIdentifier:@"Chat"];
//    [CVC view];
//    
//    CUIChatCellTableViewCell *SUT = [[CVC chatTableView]cel];
//    
//    XCTAssertNotNil([SUT nameLabel]);
}

@end


@interface ChatTableViewDelegateTests : XCTestCase
{
    CViewController *CVC;
    CChatTableViewDelegate *SUT;
}

@end

@implementation ChatTableViewDelegateTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    
    CVC = [storyBoard instantiateViewControllerWithIdentifier:@"Chat"];
    [CVC view];
    
     SUT = [CVC chatTableViewDelegate];
    
    CChatTableViewDelegate *mockChatTableViewDelegate = [CChatTableViewDelegate Create:[CVC chatTableView] chatLogID:@"testFile"];
    [CVC setChatTableViewDelegate:mockChatTableViewDelegate];
}

- (void)tearDown
{
    NSError *error;
    [FileIOManager DeleteFile:@"testfile" error:&error];
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDoesConformToUITableViewDelegates
{
    XCTAssertTrue([SUT conformsToProtocol:@protocol(UITableViewDataSource)]);
    XCTAssertTrue([SUT conformsToProtocol:@protocol(UITableViewDelegate)]);
}

- (void)testAddChatToTableView
{
    CMessageInfo *msg = [[CMessageInfo alloc] init];
    msg.direction = Me;
    msg.name = @"Me";
    msg.message = @"testing";
    
    [[CVC chatTableView] addMessage:msg];
    
    NSIndexPath *path = [[CVC chatTableView] indexPathForLastRow];
    
    CUITableViewChatCell *cell = (CUITableViewChatCell*)[[CVC chatTableView] cellForRowAtIndexPath:path];
    
    XCTAssertNotNil(cell);
    XCTAssertEqualObjects(cell.messageLabel.text,@"testing");
}

@end
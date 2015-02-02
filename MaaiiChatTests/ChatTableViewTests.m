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
    
    SUT = [CVC chatScrollViewEventHandler];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testScrollViewShouldBeConnected
{
    XCTAssertNotNil([SUT scrollView]);
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
    CGRect scrollViewIntial = [[SUT scrollView] frame];
    CGRect keyboardFrame = CGRectMake(0, 0, 0, 30);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:UIKeyboardWillShowNotification
                                                        object:nil
                                                      userInfo:@{ UIKeyboardFrameBeginUserInfoKey : [NSValue valueWithCGRect:keyboardFrame] }];
    
    XCTAssertEqual([[SUT scrollView]frame].size.height, scrollViewIntial.size.height-30);
    XCTAssertEqual([[SUT scrollView]frame].origin.y, 0);
}

- (void)testScrollViewShouldScrollContentToBottomOnKeyboardWillAppear
{
    CGRect keyboardFrame = CGRectMake(0, 0, 0, 30);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:UIKeyboardWillShowNotification
                                                        object:nil
                                                      userInfo:@{ UIKeyboardFrameBeginUserInfoKey : [NSValue valueWithCGRect:keyboardFrame] }];
    
    XCTAssertEqual([[SUT scrollView]contentOffset].y,[[SUT scrollView] contentSize].height-[[SUT scrollView]bounds].size.height);
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
    
}

- (void)tearDown
{
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
    [SUT addMessage:@{@"direction":@1,@"name":@"Them",@"message":@"testing"}.mutableCopy];
    
    NSIndexPath *path = [NSIndexPath indexPathForRow:[[CVC chatTableView] numberOfRowsInSection:[CVC chatTableView].numberOfSections - 1] - 1 inSection:[CVC chatTableView].numberOfSections - 1];
    
    CUITableViewChatCell *cell = (CUITableViewChatCell*)[[CVC chatTableView] cellForRowAtIndexPath:path];
    
    XCTAssertNotNil(cell);
    XCTAssertEqualObjects(cell.nameLabel.text,@"Them");
    XCTAssertEqualObjects(cell.messageLabel.text,@"testing");
}

@end
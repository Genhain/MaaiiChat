//
//  ChatScrollViewTests.m
//  MaaiiChat
//
//  Created by Ben on 31/01/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CViewController.h"
#import "CChatScrollViewDelegate.h"

@interface ChatScrollViewTests : XCTestCase
{
    CChatScrollViewDelegate *SUT;
}

@end

@implementation ChatScrollViewTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    
    CViewController *CVC = [storyBoard instantiateViewControllerWithIdentifier:@"Chat"];
    [CVC view];
    
    SUT = [CVC chatScrollViewDelegate];
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

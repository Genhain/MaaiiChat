//
//  MaaiiChatTests.m
//  MaaiiChatTests
//
//  Created by Ben on 30/01/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CViewController.h"
#import "CChatBarEventHandler.h"
#import "CUIChatBar.h"

@interface ChatBarEventHandlerTests : XCTestCase
{
    CChatBarEventHandler *sut;
}
@end

@implementation ChatBarEventHandlerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    
    CViewController *CVC = [storyBoard instantiateViewControllerWithIdentifier:@"Chat"];
    [CVC view];
    
    sut = [CVC chatBarEventHandler];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCViewController_respondsToKeyboardNotifications
{
    SEL selector = NSSelectorFromString(@"keyboardWillShow:");
    XCTAssertTrue([sut respondsToSelector:selector],@" SUT does not observe keyboardWillShow");
}

- (void)testNotificationInfoIsNotNil
{
    [[NSNotificationCenter defaultCenter] postNotificationName:UIKeyboardWillShowNotification object:nil userInfo:[NSDictionary dictionary]];
    XCTAssertNotNil([sut notificationInfo]);
}

- (void)testNotificationInfoKeyboardValueIsNotNill
{
    [[NSNotificationCenter defaultCenter] postNotificationName:UIKeyboardWillShowNotification
                                                        object:nil
                                                      userInfo:@{ UIKeyboardFrameBeginUserInfoKey : [NSValue valueWithCGRect:CGRectMake(0, 0, 0, 0)] }];
    
    id object = [[sut notificationInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey];
    XCTAssertNotNil(object);
}

- (void)testChatBarEventHandler_Editing_MovesTextFieldByKeyBoardHeight
{
    
    CGRect keyboardRect = CGRectMake(0, [[UIScreen mainScreen]bounds].size.height-300,
                                     [[UIScreen mainScreen] bounds].size.width, 300);

    CGRect chatBarFrame = [[sut chatBar] frame];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:UIKeyboardWillShowNotification
                                                        object:nil
                                                      userInfo:@{ UIKeyboardFrameBeginUserInfoKey : [NSValue valueWithCGRect:keyboardRect] }];
    
    CGFloat expected = [[sut chatBar] frame].origin.y;
    CGFloat actual = CGRectOffset(chatBarFrame, 0, -300).origin.y;
    
    XCTAssertEqual(expected,actual);
}


@end

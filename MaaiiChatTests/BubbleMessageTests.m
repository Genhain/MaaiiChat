//
//  BubbleMessageTests.m
//  MaaiiChat
//
//  Created by Ben on 01/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "CUIBubbleMessage.h"
#import "UIView+NibLoading.h"

@interface BubbleMessageTests : XCTestCase
{
    CUIBubbleMessage *SUT;
}

@end

@implementation BubbleMessageTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
   SUT = [CUIBubbleMessage loadFromNib];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBubbleImageShouldBeConnected
{
    XCTAssertNotNil([SUT bubbleImage]);
}

- (void)testBubbleLabelShouldBeConnected
{
    XCTAssertNotNil([SUT bubbleLabel]);
}


@end

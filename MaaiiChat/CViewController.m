//
//  CViewController.m
//  MaaiiChat
//
//  Created by Ben on 30/01/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import "CViewController.h"
#import "CChatBarEventHandler.h"
#import "CChatScrollViewEventHandler.h"

@interface CViewController ()
{
    id currentKeyboard;
}

@end

@implementation CViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _chatBarEventHandler = [CChatBarEventHandler Create:_chatBar];
    _chatScrollViewEventHandler = [CChatScrollViewEventHandler Create:_chatScrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

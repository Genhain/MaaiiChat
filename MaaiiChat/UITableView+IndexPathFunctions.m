//
//  UITableView+IndexPathFunctions.m
//  MaaiiChat
//
//  Created by Ben on 02/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import "UITableView+IndexPathFunctions.h"

@implementation UITableView (IndexPathFunctions)

- (NSIndexPath*)indexPathForLastRow
{
    NSInteger row = [self numberOfRowsInSection:self.numberOfSections - 1] - 1;
    NSInteger section =self.numberOfSections - 1;
    
    return [NSIndexPath indexPathForRow:row inSection:section];
}

- (CGRect)rectForBottomRow
{
    return CGRectMake(0, self.contentSize.height - self.bounds.size.height, self.bounds.size.width, self.bounds.size.height);
}

@end

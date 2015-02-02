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
    return[NSIndexPath indexPathForRow:[self numberOfRowsInSection:self.numberOfSections - 1] - 1 inSection:self.numberOfSections - 1];
}

@end

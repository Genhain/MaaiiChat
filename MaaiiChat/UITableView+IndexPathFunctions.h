//
//  UITableView+IndexPathFunctions.h
//  MaaiiChat
//
//  Created by Ben on 02/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (IndexPathFunctions)

- (NSIndexPath*)indexPathForLastRow;
- (CGRect)rectForBottomRow;

@end

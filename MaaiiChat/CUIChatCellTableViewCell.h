//
//  CUIChatCellTableViewCell.h
//  MaaiiChat
//
//  Created by Ben on 01/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CUIChatCellTableViewCell : UITableViewCell 

@property (weak,    nonatomic) IBOutlet UILabel *nameLabel;
@property (weak,    nonatomic) IBOutlet UILabel *messageLabel;

@end

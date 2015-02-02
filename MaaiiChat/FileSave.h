//
//  FileSave.h
//  SSGA MKII
//
//  Created by Ben Fowler on 16/7/13.
//  Copyright (c) 2013 Ben Fowler. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDefaultKey @"root"

@interface FileSave : NSObject

+ (void)Save:(id)object fileName:(NSString*)fileName;
+ (void)Save:(id)object fileName:(NSString*)fileName forKey:(NSString*)key;

@end

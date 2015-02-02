//
//  FileLoad.h
//  SSGA MKII
//
//  Created by Ben Fowler on 16/7/13.
//  Copyright (c) 2013 Ben Fowler. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDefaultKey @"root"

@interface FileLoad : NSObject

+ (id)LoadObjectForFileName:(NSString*)fileName;
+ (id)LoadObjectForFileName:(NSString*)fileName forKey:(NSString*)key;

@end

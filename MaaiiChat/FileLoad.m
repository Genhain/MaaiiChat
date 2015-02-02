//
//  FileLoad.m
//  SSGA MKII
//
//  Created by Ben Fowler on 16/7/13.
//  Copyright (c) 2013 Ben Fowler. All rights reserved.
//

#import "FileLoad.h"

@implementation FileLoad

+ (id)LoadObjectForFileName:(NSString*)fileName
{
    return [FileLoad LoadObjectForFileName:fileName forKey:nil];
}

+ (id)LoadObjectForFileName:(NSString*)fileName forKey:(NSString*)key
{
    NSString *path = [NSString stringWithFormat:@"~/Documents/%@",fileName];
    path = [path stringByExpandingTildeInPath];
    
    NSMutableDictionary *rootObject;
    rootObject = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    if(!key)
    {
        key = @"default";
    }
    
    if ([rootObject valueForKey:key])
    {
        return [rootObject valueForKey:key];
    }
    
    return nil;
}

@end

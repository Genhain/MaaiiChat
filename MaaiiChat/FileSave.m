//
//  FileSave.m
//  SSGA MKII
//
//  Created by Ben Fowler on 16/7/13.
//  Copyright (c) 2013 Ben Fowler. All rights reserved.
//

#import "FileSave.h"

@implementation FileSave

+ (void)Save:(id)object fileName:(NSString *)fileName
{
    [FileSave Save:object fileName:fileName forKey:nil];
}

+ (void)Save:(id)object fileName:(NSString*)fileName forKey:(NSString*)key
{
    NSString *path = [NSString stringWithFormat:@"~/Documents/%@",fileName];
    path = [path stringByExpandingTildeInPath];
    
    NSMutableDictionary *rootObject;
    rootObject = [NSMutableDictionary dictionary];
    
    if (!key)
    {
        key = @"default";
    }
    
    [rootObject setValue:object forKey:key];
    
    [NSKeyedArchiver archiveRootObject:rootObject toFile:path];
}

@end

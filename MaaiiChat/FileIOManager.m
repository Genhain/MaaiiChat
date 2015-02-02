//
//  FileIOManager.m
//
//  Created by Ben Fowler on 27/9/13.
//
//

#import "FileIOManager.h"
#import "FileSave.h"
#import "FileLoad.h"

@implementation FileIOManager

+ (void)Save:(id)object fileName:(NSString*)fileName
{
    [FileSave Save:object fileName:fileName];
}

+ (void)Save:(id)object fileName:(NSString*)fileName forKey:(NSString*)key
{
    [FileSave Save:object fileName:fileName forKey:key];
}

+ (id)LoadObjectForFileName:(NSString*)fileName
{
    return [FileLoad LoadObjectForFileName:fileName];
}

+ (id)LoadObjectForFileName:(NSString*)fileName forKey:(NSString*)key
{
    return [FileLoad LoadObjectForFileName:fileName forKey:key];
}

+ (BOOL)DeleteFile:(NSString*)filename error:(NSError **)err
{
    NSFileManager *fm = [NSFileManager defaultManager];
    
    NSString *path = [NSString stringWithFormat:@"~/Documents/%@",filename];
    path = [path stringByExpandingTildeInPath];
    
    BOOL exists = [fm fileExistsAtPath:path];
    
    if(exists == YES)
    {
        if ([fm isDeletableFileAtPath:path])
        {
            return [fm removeItemAtPath:path error:err];
        }
        
    }
    return exists;
}

@end

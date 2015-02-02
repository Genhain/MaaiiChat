//
//  FileIOManager.h
//
//  Created by Ben Fowler on 27/9/13.
//
//

#import <Foundation/Foundation.h>

#define kDefaultKey @"root"


@class FileSave;
@class FileLoad;

@interface FileIOManager : NSObject

+ ( void ) Save:(id)object fileName:(NSString*)fileName;
+ ( void ) Save:(id)object fileName:(NSString*)fileName forKey:(NSString*)key;
+ ( id ) LoadObjectForFileName:(NSString*)fileName;
+ ( id ) LoadObjectForFileName:(NSString*)fileName forKey:(NSString*)key;
+ ( BOOL ) DeleteFile:(NSString*)filename error:(NSError **)err;

@end

//
//  EDZInvImagePathTool.m
//  edianzu
//
//  Created by fengbang on 2019/9/3.
//  Copyright © 2019 edianzu. All rights reserved.
//

#import "EDZImagePathTool.h"

@implementation EDZImagePathTool

+ (NSString *)folderName {
    return NSStringFromClass([self class]);
}

+ (NSString *)filePathWithName:(NSString *)name {
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    
    NSArray *nameArr = [name componentsSeparatedByString:@"/"];
    NSMutableArray *mutArr = [NSMutableArray arrayWithArray:nameArr];
    [mutArr removeLastObject];
    NSString *preName = [mutArr componentsJoinedByString:@"/"];
    NSString *folderPath = [[paths firstObject]stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@",[self folderName],preName]];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:folderPath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString *filePath = [[paths firstObject]stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@",[self folderName],name]];
    
    return filePath;
}

+ (BOOL)saveImage:(UIImage *)image name:(NSString *)name {
    NSString *filePath = [self filePathWithName:name];
    
    BOOL result =[UIImagePNGRepresentation(image) writeToFile:filePath atomically:YES];
    return result;
    
}

+ (UIImage *)getImageWithName:(NSString *)name {
    NSString *filePath = [self filePathWithName:name];
    UIImage *img = [UIImage imageWithContentsOfFile:filePath];
    return img;
}

+ (BOOL)exitImageWithName:(NSString *)name {
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *filePath = [[paths firstObject]stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@",[self folderName],name]];
    return [[NSFileManager defaultManager] fileExistsAtPath:filePath];
}

//将图片从本地删除
+ (BOOL)removeImageWithName:(NSString *)name {
    NSString *filePath = [self filePathWithName:name];
    return [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
}

+ (BOOL)removeAllFiles {
    NSString *filePath = [self filePathWithName:@""];
    return [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
}

@end

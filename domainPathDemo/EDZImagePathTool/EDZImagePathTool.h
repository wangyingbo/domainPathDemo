//
//  EDZInvImagePathTool.h
//  edianzu
//
//  Created by fengbang on 2019/9/3.
//  Copyright © 2019 edianzu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EDZImagePathTool : NSObject

+ (NSString *)folderName;

+ (BOOL)saveImage:(UIImage *)image name:(NSString *)name;

+ (UIImage *)getImageWithName:(NSString *)name;

+ (BOOL)exitImageWithName:(NSString *)name;

+ (BOOL)removeImageWithName:(NSString *)name;

+ (BOOL)removeAllFiles;

@end

NS_ASSUME_NONNULL_END

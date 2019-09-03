//
//  ViewController.m
//  domainPathDemo
//
//  Created by fengbang on 2019/9/3.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "ViewController.h"
#import "YBImagePath.h"
#import "YBDomainPathTool.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat w = 128.f;
    CGFloat h = 192.f;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - w/2, [UIScreen mainScreen].bounds.size.height/2 - h/2, w, h)];
    imageView.backgroundColor = [UIColor colorWithWhite:.9 alpha:1];
    [self.view addSubview:imageView];
    self.imageView = imageView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    if (self.imageView.image) {
//        [YBImagePath removeImageWithName:@"mine"];
//    }else {
//        UIImage *image = [UIImage imageNamed:@"launch"];
//        [YBImagePath saveImage:image name:@"mine/test"];
//        self.imageView.image = [YBImagePath getImageWithName:@"mine/test"];
//    }
    
    if (self.imageView.image) {
        [YBDomainPathTool removeDataWithName:@"mine"];
        self.imageView.image = nil;
    }else {
        UIImage *image = [UIImage imageNamed:@"launch"];
        [YBDomainPathTool saveData:UIImagePNGRepresentation(image) name:@"1530/5042856/signPic"];
        self.imageView.image = [UIImage imageWithData:[YBDomainPathTool getDataWithName:@"1530/5042856/signPic"]];
    }
}


@end

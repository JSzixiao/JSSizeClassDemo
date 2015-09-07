//
//  ViewController.m
//  SizeClassesDemo
//
//  Created by jason on 15/8/18.
//  Copyright (c) 2015年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (strong, nonatomic) NSLayoutConstraint *tmp_R_Leading;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self constraintButtonFunctionWithCollection:self.view.traitCollection];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//转屏会调用该方法
-(void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
        [self constraintButtonFunctionWithCollection:newCollection];
        
    } completion:nil];
    
    
}

/**
 *  基于当前的Size Class信息做不同的处理
 *
 *  @param collection Size Class信息
 */
-(void)constraintButtonFunctionWithCollection:(UITraitCollection *)collection
{
    return;
    //另一种方式实现，该方式使用代码实现两个按钮居中显示
    if (collection.horizontalSizeClass == UIUserInterfaceSizeClassCompact && collection.verticalSizeClass == UIUserInterfaceSizeClassRegular) {
        
        float tmpWidth = [UIScreen mainScreen].applicationFrame.size.width;
        
        float tmpLeadingSpace = (tmpWidth - 60 - 60 - 40) / 2;
        
        self.tmp_R_Leading = [NSLayoutConstraint constraintWithItem:self.registerButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:tmpLeadingSpace];
        self.tmp_R_Leading.active = YES;
        
    } else {
        self.tmp_R_Leading.active = NO;
    }
}
@end

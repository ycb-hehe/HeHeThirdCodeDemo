//
//  SVProgressVViewController.m
//  HeHeThirdCodeDemo
//
//  Created by ycb on 2018/2/2.
//  Copyright © 2018年 ycb. All rights reserved.
//

#import "SVProgressViewController.h"
#import "SVProgressHUD.h"

static const CGFloat DissisTime = 1.5f;

@interface SVProgressViewController ()

@end

@implementation SVProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)show:(id)sender {
     [SVProgressHUD show];
    [self performSelector:@selector(increaseProgress) withObject:nil afterDelay:DissisTime];
}

- (IBAction)showWithStatus:(id)sender {
    [SVProgressHUD showWithStatus:@"显示内容"];
    [self performSelector:@selector(increaseProgress) withObject:nil afterDelay:DissisTime];
}

- (IBAction)showWithProgress:(id)sender {
    [SVProgressHUD showProgress:0 status:@"Loading"];
    [self performSelector:@selector(increaseProgress) withObject:nil afterDelay:DissisTime];
}

- (IBAction)showSuccessWithStatus:(id)sender {
    [SVProgressHUD showSuccessWithStatus:@"成功提示"];
}


- (IBAction)showErrorWithStatus:(id)sender {
    [SVProgressHUD showErrorWithStatus:@"error提示"];
}

- (IBAction)dismiss:(id)sender {
    [SVProgressHUD dismiss];
}

#pragma mark - Segement
- (IBAction)styleDidChanged:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl*)sender;
    if(segmentedControl.selectedSegmentIndex == 0){
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];
    } else {
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    }
}

- (IBAction)AnimationTypeDidChanged:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl*)sender;
    if(segmentedControl.selectedSegmentIndex == 0){
        [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeFlat];
    } else {
        [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    }
}

- (IBAction)MaskTypeDidChanged:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl*)sender;
    if(segmentedControl.selectedSegmentIndex == 0){
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    } else if(segmentedControl.selectedSegmentIndex == 1){
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    } else if(segmentedControl.selectedSegmentIndex == 2){
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    } else if(segmentedControl.selectedSegmentIndex == 3){
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    } else {
        [SVProgressHUD setBackgroundLayerColor:[[UIColor redColor] colorWithAlphaComponent:0.4]];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeCustom];
    }
}

#pragma mark - Other
- (void)increaseProgress
{
    [SVProgressHUD dismiss];
}

@end

//
//  UIViewController+NavBar.m
//  CYOC
//
//  Created by hehe on 14-3-31.
//  Copyright (c) 2014年 changyou. All rights reserved.
//

#import "UIViewController+NavBar.h"

@implementation UIViewController (NavBar)

- (UIImageView *)logoView
{
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0.f, 110.f, 25.f)];
    iv.contentMode=UIViewContentModeScaleAspectFit;
    iv.image = [UIImage imageNamed:@"nav_bar_logo"];
    return iv;
}


- (UIBarButtonItem *)getNavigationItemBackBarButtonItem
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0.f, 0.f, 25.f, 20.f);
    [backBtn setImage:[UIImage imageNamed:@"nav_back_btn"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"nav_back_btn"] forState:UIControlStateHighlighted];
    [backBtn addTarget:self action:@selector(backToPreviousViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    return backBarButton;
}

- (UILabel *)titleLabelWithText:(NSString *)theText
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(.0f, .0f, 160.f, 25.f)];
    titleLabel.font = [UIFont boldSystemFontOfSize:19.f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = theText;
    return titleLabel;
}


- (UIBarButtonItem *)getNavigationItemBackBarButtonItemWithTarget:(id)target action:(SEL)action
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0.f, 0.f, 25.f, 20.f);
    [backBtn setImage:[UIImage imageNamed:@"nav_back_btn"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"nav_back_btn"] forState:UIControlStateHighlighted];
    [backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    return backBarButton;
}


- (void)backToPreviousViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (UIBarButtonItem *)customBarButtonWithNorImage:(UIImage *)norImage
                                        selImage:(UIImage *)selImage
                                          Target:(id)target
                                          action:(SEL)acticon
{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:acticon forControlEvents:UIControlEventTouchUpInside];

    
    CGSize size = CGSizeZero;
    if (norImage) {
        size = norImage.size;
        [btn setImage:norImage forState:UIControlStateNormal];
    }
    if (selImage) {
        size = norImage.size;
        [btn setImage:selImage forState:UIControlStateHighlighted];
    }
    btn.frame = CGRectMake(0, 0, size.width, size.height);
    
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return barItem;

}

@end

//
//  CCPlaneActivityIndicatorView.h
//  CCActivityIndicatorView
//
//  Created by 陈 爱彬 on 14-7-17.
//  Copyright (c) 2014年 陈爱彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCPlaneActivityIndicatorView : UIView

/**
 *  矩形颜色
 */
@property (nonatomic) UIColor *planeColor;

/**
 *  矩形数量,默认为5个
 */
@property (nonatomic) NSUInteger numbers;

/**
 *  间隔
 */
@property (nonatomic) CGFloat spacing;

/**
 *  矩形大小
 */
@property (nonatomic) CGSize size;

/**
 *  动画持续时间
 */
@property (nonatomic) CGFloat duration;

/**
 *  动画延迟时间
 */
@property (nonatomic) CGFloat delay;


- (void)startAnimating;

- (void)stopAnimating;

@end

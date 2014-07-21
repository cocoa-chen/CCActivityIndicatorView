//
//  CCRotatingCurveActivityIndicatorView.h
//  CCActivityIndicatorView
//
//  Created by 陈 爱彬 on 14-7-17.
//  Copyright (c) 2014年 陈爱彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCRotatingCurveActivityIndicatorView : UIView

/**
 *  弧形的颜色
 */
@property (nonatomic) UIColor *curveColor;

/**
 *  底部圆环颜色
 */
@property (nonatomic) UIColor *backgroundCircleColor;

/**
 *  是否添加底部圆环,默认为YES
 */
@property (nonatomic) BOOL addBackgroundCircle;

/**
 *  半径
 */
@property (nonatomic) CGFloat radius;

/**
 *  动画间隔时间，默认为1.5s
 */
@property (nonatomic) CGFloat duration;

- (void)startAnimating;

- (void)stopAnimating;

@end

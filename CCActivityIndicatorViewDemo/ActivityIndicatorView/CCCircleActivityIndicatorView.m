//
//  CCCircleActivityIndicatorView.m
//  CCActivityIndicatorView
//
//  Created by 陈 爱彬 on 14-7-17.
//  Copyright (c) 2014年 陈爱彬. All rights reserved.
//

#import "CCCircleActivityIndicatorView.h"

@interface CCCircleActivityIndicatorView()
{
    CAShapeLayer *_backgroundLayer;
    CAShapeLayer *_circleLayer;
}
@property (nonatomic) BOOL isAnimating;
@end

@implementation CCCircleActivityIndicatorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self commonInit];
    }
    return self;
}
- (id)init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}
- (void)commonInit
{
    self.curveColor = CCRGBCOLOR(57, 135, 224);
    self.backgroundCircleColor = CCRGBCOLOR(200, 200, 200);
    self.radius = 15;
    self.duration = 3.0;
}
- (void)addMovingCircleView
{
    CGPoint arcCenter = CGPointMake(CGRectGetWidth(self.bounds) * 0.5, CGRectGetHeight(self.bounds) * 0.5);
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:arcCenter radius:_radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    _backgroundLayer = [CAShapeLayer layer];
    _backgroundLayer.path = circlePath.CGPath;
    _backgroundLayer.lineCap = kCALineCapRound;
    _backgroundLayer.strokeColor = _backgroundCircleColor.CGColor;
    _backgroundLayer.fillColor = nil;
    _backgroundLayer.lineWidth = 2;
    [self.layer addSublayer:_backgroundLayer];
    
    UIBezierPath *curvePath = [UIBezierPath bezierPathWithArcCenter:arcCenter radius:_radius startAngle:M_PI * 1.5 endAngle:M_PI * 2 clockwise:YES];
    _circleLayer = [CAShapeLayer layer];
    _circleLayer.path = curvePath.CGPath;
    _circleLayer.lineCap = kCALineCapRound;
    _circleLayer.strokeColor = _curveColor.CGColor;
    _circleLayer.fillColor = nil;
    _circleLayer.lineWidth = 2;
    _circleLayer.strokeStart = 0.f;
    _circleLayer.strokeEnd = 0.f;
    [self.layer addSublayer:_circleLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = _duration * 0.5;
    animation.fromValue = @0;
    animation.toValue = @(M_PI * 1.5);
    animation.beginTime = _duration * 0.25;
    animation.autoreverses = NO;
    animation.repeatCount = 0.f;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;

    CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.duration = _duration / 4;
    strokeEndAnimation.fromValue = @(0);
    strokeEndAnimation.toValue = @(1);
    strokeEndAnimation.beginTime = 0;
    strokeEndAnimation.autoreverses = NO;
    strokeEndAnimation.repeatCount = 0.f;
    strokeEndAnimation.fillMode = kCAFillModeForwards;
    strokeEndAnimation.removedOnCompletion = NO;

    CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    strokeStartAnimation.duration = _duration * 0.25;
    strokeStartAnimation.fromValue = @(0);
    strokeStartAnimation.toValue = @(1);
    strokeStartAnimation.beginTime = _duration * 0.75;
    strokeStartAnimation.autoreverses = NO;
    strokeStartAnimation.repeatCount = 0.f;
    strokeStartAnimation.fillMode = kCAFillModeForwards;
    strokeStartAnimation.removedOnCompletion = NO;

    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:strokeEndAnimation,animation,strokeStartAnimation, nil];
    group.duration = _duration;
    group.autoreverses = NO;
    group.beginTime = CACurrentMediaTime();
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.repeatCount = INFINITY;
    
    [_circleLayer addAnimation:group forKey:@"circleAnimation"];
}

- (void)removeMovingCircleView
{
    [self.layer.sublayers enumerateObjectsUsingBlock:^(CAShapeLayer *obj, NSUInteger idx, BOOL *stop){
        [obj removeAllAnimations];
    }];
    [_backgroundLayer removeFromSuperlayer];
    [_circleLayer removeFromSuperlayer];
}
#pragma mark -
#pragma mark Public Methods
- (void)startAnimating
{
    if (!_isAnimating) {
        [self addMovingCircleView];
        self.hidden = NO;
        self.isAnimating = YES;
    }
}
- (void)stopAnimating
{
    if (_isAnimating) {
        [self removeMovingCircleView];
        self.hidden = YES;
        self.isAnimating = NO;
    }
}

@end

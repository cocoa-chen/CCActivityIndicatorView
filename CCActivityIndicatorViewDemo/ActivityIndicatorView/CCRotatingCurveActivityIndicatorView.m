//
//  CCRotatingCurveActivityIndicatorView.m
//  CCActivityIndicatorView
//
//  Created by 陈 爱彬 on 14-7-17.
//  Copyright (c) 2014年 陈爱彬. All rights reserved.
//

#import "CCRotatingCurveActivityIndicatorView.h"

@interface CCRotatingCurveActivityIndicatorView()
{
    CAShapeLayer *_backgroundLayer;
    CAShapeLayer *_curveLayer;
}
@property (nonatomic) BOOL isAnimating;

@end

@implementation CCRotatingCurveActivityIndicatorView

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
    self.addBackgroundCircle = YES;
    self.radius = 15;
    self.duration = 1.5;
}
- (void)addCurveView
{
    CGPoint arcCenter = CGPointMake(CGRectGetWidth(self.bounds) * 0.5, CGRectGetHeight(self.bounds) * 0.5);
    if (_addBackgroundCircle) {
        UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:arcCenter radius:_radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
        _backgroundLayer = [CAShapeLayer layer];
        _backgroundLayer.path = circlePath.CGPath;
        _backgroundLayer.lineCap = kCALineCapRound;
        _backgroundLayer.strokeColor = _backgroundCircleColor.CGColor;
        _backgroundLayer.fillColor = nil;
        _backgroundLayer.lineWidth = 2;
        [self.layer addSublayer:_backgroundLayer];
    }
    UIBezierPath *curvePath = [UIBezierPath bezierPathWithArcCenter:arcCenter radius:_radius startAngle:M_PI * 1.2 endAngle:M_PI * 1.9 clockwise:YES];
    _curveLayer = [CAShapeLayer layer];
    _curveLayer.path = curvePath.CGPath;
    _curveLayer.lineCap = kCALineCapRound;
    _curveLayer.strokeColor = _curveColor.CGColor;
    _curveLayer.fillColor = nil;
    _curveLayer.lineWidth = 2;
    [self.layer addSublayer:_curveLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = _duration;
    animation.fromValue = @0;
    animation.toValue = @(M_PI * 2);
    animation.autoreverses = NO;
    animation.repeatCount = INFINITY;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    [_curveLayer addAnimation:animation forKey:@"transform"];
}
- (void)removeCurveView
{
    [self.layer.sublayers enumerateObjectsUsingBlock:^(CAShapeLayer *obj, NSUInteger idx, BOOL *stop){
        [obj removeAllAnimations];
    }];
    [_backgroundLayer removeFromSuperlayer];
    [_curveLayer removeFromSuperlayer];
}
#pragma mark -
#pragma mark Public Methods
- (void)startAnimating
{
    if (!_isAnimating) {
        [self addCurveView];
        self.hidden = NO;
        self.isAnimating = YES;
    }
}
- (void)stopAnimating
{
    if (_isAnimating) {
        [self removeCurveView];
        self.hidden = YES;
        self.isAnimating = NO;
    }
}
@end

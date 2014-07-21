//
//  CCPlaneActivityIndicatorView.m
//  CCActivityIndicatorView
//
//  Created by 陈 爱彬 on 14-7-17.
//  Copyright (c) 2014年 陈爱彬. All rights reserved.
//

#import "CCPlaneActivityIndicatorView.h"

@interface CCPlaneActivityIndicatorView()

@property (nonatomic) BOOL isAnimating;
@end

@implementation CCPlaneActivityIndicatorView

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
    self.planeColor = CCRGBCOLOR(57, 135, 224);
    self.numbers = 5;
    self.spacing = 10;
    self.size = CGSizeMake(10, 10);
    self.duration = 1.2;
    self.delay = 0.2;
    
    [self resetPlaneFrame];
}
- (void)resetPlaneFrame
{
    CGRect frame = self.frame;
    frame.size.width = (self.numbers * (self.size.width + self.spacing)) - self.spacing;
    frame.size.height = self.size.height;
    self.frame = frame;
}
- (CAKeyframeAnimation *)planeAnimationWithDuration:(CGFloat)duration delay:(CGFloat)delay
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    animation.repeatCount = INFINITY;
    animation.beginTime = CACurrentMediaTime() + delay;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.values = @[@(1.0),@(1.5),@(1.0),@(1.0)];
    return animation;
}
- (void)addRectangleView
{
    [self resetPlaneFrame];

    for (NSInteger i = 0; i < self.numbers; i++) {
        UIView *planeView = [[UIView alloc] initWithFrame:CGRectMake((self.size.width + self.spacing) * i, 0, self.size.width, self.size.height)];
        planeView.backgroundColor = self.planeColor;
        [planeView.layer addAnimation:[self planeAnimationWithDuration:self.duration delay:self.delay * i] forKey:@"transform"];
        [self addSubview:planeView];
    }
}
- (void)removeRectangleView
{
    [self.subviews enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop){
        [obj.layer removeAllAnimations];
        [obj removeFromSuperview];
    }];
}
#pragma mark -
#pragma mark Public Methods
- (void)startAnimating
{
    if (!_isAnimating) {
        [self addRectangleView];
        self.hidden = NO;
        self.isAnimating = YES;
    }
}
- (void)stopAnimating
{
    if (_isAnimating) {
        [self removeRectangleView];
        self.hidden = YES;
        self.isAnimating = NO;
    }
}

@end

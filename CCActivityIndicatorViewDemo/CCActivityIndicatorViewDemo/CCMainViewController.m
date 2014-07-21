//
//  CCMainViewController.m
//  CCActivityIndicatorView
//
//  Created by 陈 爱彬 on 14-7-17.
//  Copyright (c) 2014年 陈爱彬. All rights reserved.
//

#import "CCMainViewController.h"
#import "CCRotatingCurveActivityIndicatorView.h"
#import "CCPlaneActivityIndicatorView.h"
#import "CCCircleActivityIndicatorView.h"
#import "CCCommonUtil.h"

@interface CCMainViewController ()
<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    CCCircleActivityIndicatorView *_circleAvtivityIndicator;
    CCRotatingCurveActivityIndicatorView *_curveIndicator;
    CCPlaneActivityIndicatorView *_planeActivityIndicator;
}
@end

@implementation CCMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = CCRGBCOLOR(230, 230, 230);

    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentSize = CGSizeMake(CGRectGetWidth(_scrollView.frame) * 3, CGRectGetHeight(_scrollView.frame));
    [self.view addSubview:_scrollView];
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame) - 60, CGRectGetWidth(self.view.frame), 60)];
    _pageControl.numberOfPages = 3;
    [self.view addSubview:_pageControl];
    
    [self addActivityIndicatorViews];
}

- (void)addActivityIndicatorViews
{
    _circleAvtivityIndicator = [[CCCircleActivityIndicatorView alloc] init];
    _circleAvtivityIndicator.center = CGPointMake(CGRectGetWidth(self.view.frame) * 0.5, 200);
    [_circleAvtivityIndicator startAnimating];
    [_scrollView addSubview:_circleAvtivityIndicator];

    _curveIndicator = [[CCRotatingCurveActivityIndicatorView alloc] init];
    _curveIndicator.center = CGPointMake(CGRectGetWidth(self.view.frame) * 1.5, 200);
    [_curveIndicator startAnimating];
    [_scrollView addSubview:_curveIndicator];
    
    _planeActivityIndicator = [[CCPlaneActivityIndicatorView alloc] init];
    _planeActivityIndicator.center = CGPointMake(CGRectGetWidth(self.view.frame) * 2.5, 200);
    [_planeActivityIndicator startAnimating];
    [_scrollView addSubview:_planeActivityIndicator];
    
    [self performSelector:@selector(stopActivityIndicatorAnimation) withObject:nil afterDelay:15];
}
- (void)startActivityIndicatorAnimation
{
    [_circleAvtivityIndicator startAnimating];
    [_curveIndicator startAnimating];
    [_planeActivityIndicator startAnimating];
    
    [self performSelector:@selector(stopActivityIndicatorAnimation) withObject:nil afterDelay:15];
}
- (void)stopActivityIndicatorAnimation
{
    [_circleAvtivityIndicator stopAnimating];
    [_curveIndicator stopAnimating];
    [_planeActivityIndicator stopAnimating];
    
    [self performSelector:@selector(startActivityIndicatorAnimation) withObject:nil afterDelay:1];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat width = CGRectGetWidth(scrollView.frame);
    NSUInteger currentPage = floor((scrollView.contentOffset.x - width / 2) / width) + 1;
    _pageControl.currentPage = currentPage;
}
@end

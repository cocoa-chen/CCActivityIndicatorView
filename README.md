CCActivityIndicatorView
=======================
自定义的ActivityIndicatorView,用作Loading效果

#####CCCircleActivityIndicatorView代码调用及效果示例
```
CCCircleActivityIndicatorView *_circleAvtivityIndicator = [[CCCircleActivityIndicatorView alloc] init];
_circleAvtivityIndicator.center = CGPointMake(CGRectGetWidth(self.view.frame) * 0.5, 200);
[_circleAvtivityIndicator startAnimating];
[self.view addSubview:_circleAvtivityIndicator];
```

![](https://raw.githubusercontent.com/cocoa-chen/CCActivityIndicatorView/master/CCActivityIndicatorViewDemo/screenshot/screenshot1.gif)

#####CCRotatingCurveActivityIndicatorView代码调用及效果示例
```
CCRotatingCurveActivityIndicatorView *_curveIndicator = [[CCRotatingCurveActivityIndicatorView alloc] init];
_curveIndicator.center = CGPointMake(CGRectGetWidth(self.view.frame) * 0.5, 200);
[_curveIndicator startAnimating];
[self.view addSubview:_curveIndicator];
```

![](https://raw.githubusercontent.com/cocoa-chen/CCActivityIndicatorView/master/CCActivityIndicatorViewDemo/screenshot/screenshot2.gif)

#####CCPlaneActivityIndicatorView代码调用及效果示例
```
CCPlaneActivityIndicatorView *_planeActivityIndicator = [[CCPlaneActivityIndicatorView alloc] init];
_planeActivityIndicator.center = CGPointMake(CGRectGetWidth(self.view.frame) * 0.5, 200);
[_planeActivityIndicator startAnimating];
[self.view addSubview:_planeActivityIndicator];
```

![](https://raw.githubusercontent.com/cocoa-chen/CCActivityIndicatorView/master/CCActivityIndicatorViewDemo/screenshot/screenshot3.gif)


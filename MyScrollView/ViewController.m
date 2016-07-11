//
//  ViewController.m
//  MyScrollView
//
//  Created by Rene Mojica on 2016-07-11.
//  Copyright © 2016 Rene Mojica. All rights reserved.
//

#import "ViewController.h"
#import "MyScrollView.h"

@interface ViewController ()

@property (nonatomic) UIView *containerView;
@property (nonatomic, strong) UIView *myScrollView;
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;
@property CGSize contentSize;


@end

@implementation ViewController

- (void) addGestureRecognizerToScrollView {
    
    NSLog(@"%s", __PRETTY_FUNCTION__);

    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self.myScrollView action:@selector(panScrollViewVertically)];
    
    self.panGesture = panGesture;
    
    [self.myScrollView addGestureRecognizer:panGesture];
}

- (void) panScrollViewVertically {

    NSLog(@"%s", __PRETTY_FUNCTION__);
//    CGRect viewBounds = self.myScrollView.bounds;
//    
//    CGPoint vel = [self.panGesture velocityInView:self.myScrollView ];
//    if (vel.y > 0)
//    {
//        // user dragged downwards
//        viewBounds.origin.y += 1;
//        if (viewBounds.origin.y > self.myScrollView.bounds.size.height) {
//            viewBounds.origin.y = self.myScrollView.bounds.size.height;
//        }
//        self.myScrollView.bounds = viewBounds;
//        
//    }
//    else
//    {
//        // user dragged upwards
//        viewBounds.origin.y -= 1;
//        if (viewBounds.origin.y < 0) {
//            viewBounds.origin.y = 0;
//        }
//        self.myScrollView.bounds = viewBounds;
//    }
}

- (void) prepContainerView {
  NSLog(@"%s", __PRETTY_FUNCTION__);
    UIView *containerView = [[UIView alloc]initWithFrame:self.view.frame]; // container view
    [self.myScrollView addSubview:containerView];
    self.containerView = containerView;
 
}

- (void) prepMyScrollView{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    CGSize contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height);
    MyScrollView *myScrollView = [[MyScrollView alloc] initWithFrame:CGRectMake(self.view.bounds.origin.x,self.view.bounds.origin.y , self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:myScrollView];
    self.myScrollView = myScrollView;
    self.contentSize = contentSize;
    self.myScrollView.userInteractionEnabled = YES;

}

- (void) prepSubViews {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 150, 200)];
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(40, 400, 200, 150)];
    UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(100, 600, 180, 150)];
    
    redView.backgroundColor = [UIColor redColor];
    greenView.backgroundColor = [UIColor greenColor];
    blueView.backgroundColor = [UIColor blueColor];
    yellowView.backgroundColor = [UIColor yellowColor];
    
    [self.containerView addSubview:redView];
    [self.containerView addSubview:greenView];
    [self.containerView addSubview:blueView];
    [self.containerView addSubview:yellowView];
    
}

-(void)moveRootView100PointsDown {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    CGRect viewBounds = self.view.bounds;
    viewBounds.origin.y += 100;
    self.view.bounds = viewBounds;

}


- (void)viewDidLoad {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [super viewDidLoad];
    [self prepMyScrollView];
    [self prepContainerView];
    [self prepSubViews];
    [self addGestureRecognizerToScrollView];

}

- (void) viewDidAppear:(BOOL)animated {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self moveRootView100PointsDown];

}

- (void)didReceiveMemoryWarning {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

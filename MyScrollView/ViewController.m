//
//  ViewController.m
//  MyScrollView
//
//  Created by Rene Mojica on 2016-07-11.
//  Copyright © 2016 Rene Mojica. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UIView *mainView;


@end

@implementation ViewController



- (void) prepMainView {
  
    UIView *mainView = [[UIView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:mainView];
    self.mainView = mainView;
 
}

- (void) prepSubViews {
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 150, 200)];
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(40, 400, 200, 150)];
    UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(100, 600, 180, 150)];
    
    redView.backgroundColor = [UIColor redColor];
    greenView.backgroundColor = [UIColor greenColor];
    blueView.backgroundColor = [UIColor blueColor];
    yellowView.backgroundColor = [UIColor yellowColor];
    
    [self.mainView addSubview:redView];
    [self.mainView addSubview:greenView];
    [self.mainView addSubview:blueView];
    [self.mainView addSubview:yellowView];
    
}

-(void)moveRootView100PointsDown {
    
    CGRect viewBounds = self.view.bounds;
    viewBounds.origin.y += 100;
    self.view.bounds = viewBounds;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepMainView];
    [self prepSubViews];

}

- (void) viewDidAppear:(BOOL)animated {
    [self moveRootView100PointsDown];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

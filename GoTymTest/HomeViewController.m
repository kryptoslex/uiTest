//
//  HomeViewController.m
//  GoTymTest
//
//  Created by Elementz on 8/19/15.
//  Copyright (c) 2015 MyKeL. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)questionBtn:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"goToView" object:nil];
    //self.containerView.hidden = YES;
    //self.homeView.hidden = NO;
    
    //LoginViewController *loginView = [[LoginViewController alloc] init];
    /*
    //tableViewController.view.frame = self.contentView.bounds;
    [self.view addSubview:loginView.view];
    [self addChildViewController:loginView];
    [self presentViewController:loginView animated:NO completion:nil];
    [loginView didMoveToParentViewController:self];
    [self removeFromParentViewController];
    NSLog(@"switch");
    */
}
@end

//
//  HomeViewController.h
//  GoTymTest
//
//  Created by Elementz on 8/19/15.
//  Copyright (c) 2015 MyKeL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

- (IBAction)questionBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *homeView;


@end

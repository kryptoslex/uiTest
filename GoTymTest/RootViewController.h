//
//  RootViewController.h
//  GoTymTest
//
//  Created by MyKeL on 8/16/15.
//  Copyright (c) 2015 MyKeL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *homeView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UILabel *homeTxt1;
@property (weak, nonatomic) IBOutlet UILabel *homeTxt2;

@property (weak, nonatomic) IBOutlet UIImageView *training;
@property (weak, nonatomic) IBOutlet UIImageView *yoga;
@property (weak, nonatomic) IBOutlet UIImageView *massage;

@property (weak, nonatomic) IBOutlet UILabel *trainingTxt;
@property (weak, nonatomic) IBOutlet UILabel *yogaTxt;
@property (weak, nonatomic) IBOutlet UILabel *massageTxt;

@end

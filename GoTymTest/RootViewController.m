//
//  RootViewController.m
//  GoTymTest
//
//  Created by MyKeL on 8/16/15.
//  Copyright (c) 2015 MyKeL. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
{
    int imageCount;
    int currentPage;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.homeTxt1.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:35.0f];
    self.homeTxt2.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:40.0f];
    self.homeTxt1.textColor = [UIColor whiteColor];
    self.homeTxt2.textColor = [UIColor whiteColor];
    self.homeTxt1.shadowColor = [UIColor darkGrayColor];
    self.homeTxt2.shadowColor = [UIColor darkGrayColor];
    self.trainingTxt.textColor = [UIColor whiteColor];
    self.trainingTxt.shadowColor = [UIColor darkGrayColor];
    self.yogaTxt.textColor = [UIColor whiteColor];
    self.yogaTxt.shadowColor = [UIColor darkGrayColor];
    self.massageTxt.textColor = [UIColor whiteColor];
    self.massageTxt.shadowColor = [UIColor darkGrayColor];
    
    
    self.training.layer.cornerRadius = 30;
    self.training.layer.masksToBounds = YES;
    self.yoga.layer.cornerRadius = 30;
    self.yoga.layer.masksToBounds = YES;
    self.massage.layer.cornerRadius = 30;
    self.massage.layer.masksToBounds = YES;
    
    [self setupScrollView];
    
}

-(void) setupScrollView {
    //add the scrollview to the view
    self.homeView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width,self.view.frame.size.height)];
    
    self.homeView.delegate = self;
    self.homeView.pagingEnabled = YES;
    [self.homeView setAlwaysBounceVertical:NO];
    
    imageCount = 3;
    for (int i = 0; i < imageCount; i++) {
        CGFloat xOrigin = i * self.view.frame.size.width;
        UIImageView *image = [[UIImageView alloc] initWithFrame:
                              CGRectMake(xOrigin, 0,
                                         self.view.frame.size.width,
                                         self.view.frame.size.height)];
        image.image = [UIImage imageNamed:[NSString stringWithFormat:@"home_%d", i+1]];
        image.contentMode = UIViewContentModeScaleAspectFill;
        [self.homeView addSubview:image];
    }
    
    //for rotating view
    UIImageView *imageLast = [[UIImageView alloc] initWithFrame:
                          CGRectMake(imageCount*self.view.frame.size.width, 0,
                                     self.view.frame.size.width,
                                     self.view.frame.size.height)];
    imageLast.image = [UIImage imageNamed:@"home_1"];
    imageLast.contentMode = UIViewContentModeScaleAspectFill;
    [self.homeView addSubview:imageLast];

    
    [self.homeView setContentSize:CGSizeMake(self.view.frame.size.width * (imageCount + 1), self.view.frame.size.height)];
    [self.homeView setContentOffset:CGPointMake(0, 0)];
    [self.view addSubview:self.homeView];
    [self.homeView scrollRectToVisible:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height) animated:NO]; //initialize to firstpage
    
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(scrollingTimer) userInfo:nil repeats:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)sender
{
/*
    currentPage = floor((self.homeView.contentOffset.x - self.homeView.frame.size.width / (imageCount+2)) / self.homeView.frame.size.width) + 1;
    NSLog(@"page = %d, imageCount %d", currentPage, imageCount);
    self.pageControl.currentPage = currentPage;
    if (currentPage == 0)
    {
        //go last but 1 page
        [self.homeView scrollRectToVisible:CGRectMake(self.homeView.frame.size.width  * currentPage,0,self.homeView.frame.size.width ,self.homeView.frame.size.height ) animated:NO];
    }
    else if (currentPage==imageCount)
    {
        NSLog(@"Loop again");
        [self.homeView scrollRectToVisible:CGRectMake(0,0,self.homeView.frame.size.width ,self.homeView.frame.size.height) animated:NO];
        self.pageControl.currentPage = 0;
    }
*/
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //fading animation transistion
    [UIView transitionWithView:self.homeView duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
    } completion:^(BOOL finished) {
    }];
}

- (void)scrollingTimer
{
    currentPage = floor((self.homeView.contentOffset.x - self.homeView.frame.size.width / (imageCount+2)) / self.homeView.frame.size.width) + 1;
    NSLog(@"page = %d, imageCount %d", currentPage, imageCount);
    int next = currentPage+1;
    
    if (next == imageCount)
    {
        NSLog(@"Loop again");
        [self.homeView scrollRectToVisible:CGRectMake(0,0,self.homeView.frame.size.width ,self.homeView.frame.size.height) animated:NO];
        self.pageControl.currentPage = 0;
    }
    else
    {
        //go last but 1 page
        NSLog(@"move!");
        [self.homeView scrollRectToVisible:CGRectMake(self.homeView.frame.size.width  * next,0,self.homeView.frame.size.width ,self.homeView.frame.size.height ) animated:NO];
        self.pageControl.currentPage = currentPage+1;
    }
    
}


//disable autorotate - portrait view only
- (BOOL)shouldAutorotate
{
    id currentViewController = self;
    
    if ([currentViewController isKindOfClass:[UIViewController class]])
        return NO;
    
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)yogaButton:(id)sender {
}

- (IBAction)massageButton:(id)sender {
}

- (IBAction)trainingButton:(id)sender {
}
@end

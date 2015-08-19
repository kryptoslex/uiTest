//
//  RootViewController.m
//  GoTymTest
//
//  Created by MyKeL on 8/16/15.
//  Copyright (c) 2015 MyKeL. All rights reserved.
//

#import "RootViewController.h"
#import "UIView+Genie.h"

@interface RootViewController ()
{
    int imageCount;
    int currentPage;
    CGFloat viewFullWidth;
    CGFloat viewFullHeight;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    viewFullWidth = screenRect.size.width;
    viewFullHeight = screenRect.size.height;
    NSLog(@"%f,%f", viewFullWidth, viewFullHeight);
    
    // Do any additional setup after loading the view.
    self.homeTxt1.font = [UIFont fontWithName:@"AvenirNext-UltraLight" size:35.0f];
    self.homeTxt2.font = [UIFont fontWithName:@"AvenirNext-UltraLight" size:40.0f];
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeView:) name:@"goToView" object:nil];
    
    
}


- (void)changeView:(NSNotification*) notif
{

    CGRect endRect = CGRectMake(self.view.frame.size.width-35, 35, 0, 0);
    [self.view genieInTransitionWithDuration:0.7
                        destinationRect:endRect
                        destinationEdge:BCRectEdgeLeft
                             completion:^{
                                 NSLog(@"I'm done!");
                             }];
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
    NSLog(@"genie effect!");
    
}

-(void) setupScrollView {
    //add the scrollview to the view
    self.homeView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,viewFullWidth,viewFullHeight)];
    
    self.homeView.delegate = self;
    self.homeView.pagingEnabled = YES;
    [self.homeView setAlwaysBounceVertical:NO];
    
    imageCount = 3;
    for (int i = 0; i < imageCount; i++) {
        CGFloat xOrigin = i * viewFullWidth;
        UIImageView *image = [[UIImageView alloc] initWithFrame:
                              CGRectMake(xOrigin, 0,
                                         viewFullWidth,
                                         viewFullHeight)];
        image.image = [UIImage imageNamed:[NSString stringWithFormat:@"home_%d", i+1]];
        image.contentMode = UIViewContentModeScaleAspectFill;
        [self.homeView addSubview:image];
    }
    
    //for rotating view
    UIImageView *imageLast = [[UIImageView alloc] initWithFrame:
                          CGRectMake(imageCount*viewFullWidth, 0,
                                     viewFullWidth,
                                     viewFullHeight)];
    imageLast.image = [UIImage imageNamed:@"home_1"];
    imageLast.contentMode = UIViewContentModeScaleAspectFill;
    [self.homeView addSubview:imageLast];

    
    [self.homeView setContentSize:CGSizeMake(viewFullWidth * (imageCount + 1), viewFullHeight)];
    [self.homeView setContentOffset:CGPointMake(0, 0)];
    [self.view addSubview:self.homeView];
    //[self.homeView scrollRectToVisible:CGRectMake(0,0,viewFullWidth,viewFullHeight) animated:NO]; //initialize to firstpage
    
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(scrollingTimer) userInfo:nil repeats:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)sender
{

    currentPage = floor((self.homeView.contentOffset.x - self.homeView.frame.size.width / (imageCount+2)) / self.homeView.frame.size.width) + 1;
    //NSLog(@"page = %d, imageCount %d", currentPage, imageCount);
    self.pageControl.currentPage = currentPage;
    if (currentPage == 0)
    {
        //go last but 1 page
        [self.homeView scrollRectToVisible:CGRectMake(self.homeView.frame.size.width  * currentPage,0,self.homeView.frame.size.width ,self.homeView.frame.size.height ) animated:NO];
    }
    else if (currentPage==imageCount)
    {
        //NSLog(@"Loop again");
        [self.homeView scrollRectToVisible:CGRectMake(0,0,self.homeView.frame.size.width ,self.homeView.frame.size.height) animated:NO];
        self.pageControl.currentPage = 0;
    }

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //fading animation transistion
    [UIView transitionWithView:self.homeView duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
    } completion:^(BOOL finished) {
    }];
    //[UIView transitionWithView:self.homeView duration:1.0 options:UIV animations:^{
    //} completion:^(BOOL finished) {
    //}];
}

- (void)scrollingTimer
{
    currentPage = floor((self.homeView.contentOffset.x - viewFullWidth / (imageCount+2)) / viewFullWidth) + 1;
    //NSLog(@"page = %d, imageCount %d", currentPage, imageCount);
    int next = currentPage+1;
    
    if (next == imageCount)
    {
        //NSLog(@"Loop again");
        [self.homeView scrollRectToVisible:CGRectMake(0,0,viewFullWidth ,viewFullHeight) animated:NO];
        self.pageControl.currentPage = 0;
    }
    else
    {
        //go last but 1 page
        //NSLog(@"move!");
        [self.homeView scrollRectToVisible:CGRectMake(viewFullWidth * next,0,viewFullWidth ,viewFullHeight) animated:NO];
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

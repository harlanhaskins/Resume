//
//  AppsViewController.m
//  HarlanHaskins
//
//  Created by Harlan Haskins on 4/29/13.
//  Copyright (c) 2013 Valley Rocket. All rights reserved.
//

#import "AppsViewController.h"
#import "PageViewController.h"

@interface AppsViewController ()

@end

@implementation AppsViewController {
    NSInteger index;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id) init {
    self = [super init];
    if (self) {
        // Option dictionary with inter page spacing
        NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:20.0f] forKey:UIPageViewControllerOptionInterPageSpacingKey];
        self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
        index = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _pageViewController.delegate = self;
    _pageViewController.dataSource = self;
    
    PageViewController *alphaCalcPage = [[PageViewController alloc] initWithTitle:@"Alpha Calc" ScreenShot:[UIImage imageNamed:@"Alpha-Calc.png"]];
    PageViewController *dailyCommutePage = [[PageViewController alloc] initWithTitle:@"Daily Commute" ScreenShot:[UIImage imageNamed:@"Daily-Commute.png"]];
    PageViewController *elianPage = [[PageViewController alloc] initWithTitle:@"Elian" ScreenShot:[UIImage imageNamed:@"Elian.png"]];
    PageViewController *piclPage = [[PageViewController alloc] initWithTitle:@"picl" ScreenShot:[UIImage imageNamed:@"picl.png"]];
    PageViewController *statAttackPage = [[PageViewController alloc] initWithTitle:@"StatAttack" ScreenShot:[UIImage imageNamed:@"StatAttack.png"]];
    
    [_pageViewController setViewControllers:@[alphaCalcPage] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    _pages = @[alphaCalcPage, dailyCommutePage, elianPage, piclPage, statAttackPage];
    
    int i = 0;
    for (PageViewController *page in _pages) {
        page.tag = i;
        i++;
    }
    
    CGRect pageViewControllerFrame = _pageViewController.view.frame;
        pageViewControllerFrame.size.height -= 22.0f;
    _pageViewController.view.frame = pageViewControllerFrame;
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.view sendSubviewToBack:_pageViewController.view];
}

-(void) pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers {
    if (index < [(PageViewController*)pendingViewControllers[0] tag]) {
        index++;
    }
    else {
        index--;
    }
}

-(UIViewController*) pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    return index == ([_pages count] - 1) ? nil : _pages[index + 1];
}


-(UIViewController*) pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    return index == 0 ? nil : _pages[index - 1];
}

// Return the total count of all pages.
- (NSInteger) presentationCountForPageViewController:(UIPageViewController *)pageViewController{
    return 5;
}

// Return the index of the currently displayed page.
- (NSInteger) presentationIndexForPageViewController:(UIPageViewController *)pageViewController{
    return index;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

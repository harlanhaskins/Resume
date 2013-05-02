//
//  PageViewController.m
//  HarlanHaskins
//
//  Created by Harlan Haskins on 4/29/13.
//  Copyright (c) 2013 Valley Rocket. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()

@end

@implementation PageViewController {
    UIImageView *screenShotView;
    UILabel *titleLabel;
    CGFloat y;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id) initWithTitle:(NSString*)title ScreenShot:(UIImage*)screenShot {
    self = [super init];
    if (self ) {
        _appTitle = title;
        _screenShot = screenShot;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 75)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont fontWithName:@"Avenir"  size:38.0f];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.shadowColor = translucentShadowColor;
    titleLabel.shadowOffset = CGSizeMake(0, 1);
    titleLabel.textColor = whiteTextColor;
    titleLabel.text = _appTitle;
    [self.view addSubview:titleLabel];
    
    screenShotView = [[UIImageView alloc] initWithImage:_screenShot];
    [self setScreenShotFrame];
    
    [self.view addSubview:screenShotView];
    
}

-(void) setScreenShotFrame {
    y = titleLabel.frame.origin.y + titleLabel.frame.size.height;
    
    [screenShotView setSizeProportionalToHeight:self.view.frame.size.height - y - 60.0f];
    
    CGRect screenShotFrame = screenShotView.frame;
    screenShotFrame.origin.y = y;
    screenShotFrame.origin.x = roundf((self.view.frame.size.width / 2) - (screenShotFrame.size.width / 2));
    screenShotView.frame = screenShotFrame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setFrame:(CGRect)frame {
    self.view.frame = frame;
    [self setScreenShotFrame];
}

@end

//
//  AppsViewController.m
//  HarlanHaskins
//
//  Created by Harlan Haskins on 4/25/13.
//  Copyright (c) 2013 Valley Rocket. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    UIImageView *arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow.png"] highlightedImage:[UIImage imageNamed:@"redarrow.png"]];
    
    arrow.transform = CGAffineTransformMakeRotation(M_PI);
    CGRect arrowFrame = arrow.frame;
        arrowFrame.origin.x = arrowFrame.origin.y = 10.0f;
        arrow.frame = arrowFrame;
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(moveBack:)];
    
    [arrow addGestureRecognizer:tapGestureRecognizer];
    arrow.userInteractionEnabled = YES;
    
    [self.view addSubview:arrow];
    [self.view bringSubviewToFront:arrow];
    self.view.backgroundColor = grayColor;
}

-(void) moveBack:(id)sender {
    UITapGestureRecognizer *tapGestureRecognizer = sender;
    UIImageView *arrow = (UIImageView*)tapGestureRecognizer.view;
    [arrow setHighlighted:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
} 

@end

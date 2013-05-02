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

@implementation DetailViewController {
    UIImageView *arrowImage;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id) initWithTitle:(NSString*)title {
    self = [super init];
    if (self) {
        _headerTitle = title;
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow.png"] highlightedImage:[UIImage imageNamed:@"redarrow.png"]];
    
    arrowImage.transform = CGAffineTransformMakeRotation(M_PI);
    CGRect arrowImageViewFrame = arrowImage.frame;
        arrowImageViewFrame.origin.x = arrowImageViewFrame.origin.y = kInset;
    arrowImage.frame = arrowImageViewFrame;
    
    
    UILabel *itemLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    
    itemLabel.font = [UIFont fontWithName:kSystemFontString size:20.0f];
    itemLabel.backgroundColor = [UIColor clearColor];
    itemLabel.shadowColor = translucentShadowColor;
    itemLabel.shadowOffset = CGSizeMake(0, 1);
    itemLabel.textAlignment = NSTextAlignmentCenter;
    itemLabel.textColor = whiteTextColor;
    itemLabel.text = self.headerTitle;
    
    [self.view addSubview:itemLabel];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(moveBack)];
    
    [arrowImage addGestureRecognizer:tapGestureRecognizer];
    arrowImage.userInteractionEnabled = YES;
    
    self.view.backgroundColor = grayColor;
    [self.view addSubview:arrowImage];
    [self.view bringSubviewToFront:arrowImage];
}

-(void) moveBack {
    [arrowImage setHighlighted:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
} 

@end

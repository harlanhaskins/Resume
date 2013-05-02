//
//  ThanksViewController.m
//  HarlanHaskins
//
//  Created by Harlan Haskins on 4/29/13.
//  Copyright (c) 2013 Valley Rocket. All rights reserved.
//

#import "ThanksViewController.h"

@interface ThanksViewController ()

@end

@implementation ThanksViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *url = kNamePlistURL;
    NSDictionary *nameDictionary = [NSDictionary dictionaryWithContentsOfFile:url.path];
    
    NSString *name = [nameDictionary objectForKey:@"fullName"];
    
    UITextView *infoTextView = [[UITextView alloc] init];
    CGRect infoTextFrame = CGRectZero;
    infoTextFrame.origin.x = kInset;
    infoTextFrame.origin.y = 5 * kInset;
    infoTextFrame.size.width = self.view.frame.size.width - infoTextFrame.origin.x - kInset;
    infoTextFrame.size.height = self.view.frame.size.height - infoTextFrame.origin.y - kInset;
    infoTextView.frame = infoTextFrame;
    
    infoTextView.backgroundColor = [UIColor colorWithWhite:0.3f alpha:0.5f];
    infoTextView.editable = NO;
    infoTextView.font = [UIFont fontWithName:kSystemFontString size:18.0f];
    infoTextView.text = [NSString stringWithFormat:@"First, I would very much like to thank you, %@, for giving up your time to review my application for a scholarship to WWDC.\n\nI would like to give a special thanks to the team at Valley Rocket, LLC, for teaching me everything I know about iOS and for being the greatest team for whom I could ask. Bobby Wilson, James Allen, Howie Jordan, and Michael Shillingburg, you guys are awesome.", name];
    infoTextView.textColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    [self.view addSubview:infoTextView];
    [self.view bringSubviewToFront:infoTextView];
    

    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];    // Dispose of any resources that can be recreated.
}

@end

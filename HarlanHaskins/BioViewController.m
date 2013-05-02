//
//  BioViewController.m
//  HarlanHaskins
//
//  Created by Harlan Haskins on 4/29/13.
//  Copyright (c) 2013 Valley Rocket. All rights reserved.
//

#import "BioViewController.h"

@interface BioViewController ()

@end

@implementation BioViewController

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
    UIImageView *headshot = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headshot.jpg"]];
    [headshot setSizeProportionalToHeight:150.0f];
    CGRect headshotFrame = headshot.frame;
        headshotFrame.origin.x = kInset;
        headshotFrame.origin.y = 5 * kInset;
    headshot.frame = headshotFrame;
    [self.view addSubview:headshot];
    [self.view sendSubviewToBack:headshot];
    
    
    UITextView *infoTextView = [[UITextView alloc] init];
    CGRect infoTextFrame = CGRectZero;
        infoTextFrame.origin.x = kInset;
        infoTextFrame.origin.y = headshotFrame.origin.y + headshotFrame.size.height + kInset;
        infoTextFrame.size.width = self.view.frame.size.width - infoTextFrame.origin.x - kInset;
        infoTextFrame.size.height = self.view.frame.size.height - infoTextFrame.origin.y - kInset;
    infoTextView.frame = infoTextFrame;
    infoTextView.backgroundColor = [UIColor colorWithWhite:0.3f alpha:0.5f];
    infoTextView.editable = NO;
    infoTextView.font = [UIFont fontWithName:kSystemFontString size:18.0f];
    infoTextView.text = @"Hello! My name is Harlan Haskins. I'm an 18 year old iOS and Web developer from Greenville, South Carolina. I've been fascinated with technology my whole life, but only recently have delved into programming. I'm graduating from Wade Hampton High School in June this year, and am slated to go to Rochester Institute of Technology in the fall. I'm currently working for Valley Rocket, LLC, a local iOS development company cofounded by my AP Computer Science teacher.\n\nI'd love to go to WWDC because I love iOS, Cocoa, and Objective-C, and I'm eager to learn as much as I can about this excellent platform. Thank you so much for your time!";
    infoTextView.textColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    [self.view addSubview:infoTextView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

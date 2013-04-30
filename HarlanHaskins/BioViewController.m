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
    CGFloat inset = 10.0f;
    UIImageView *headshot = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headshot.jpg"]];
    [headshot setSizeProportionalToHeight:200.0f];
    CGRect headshotFrame = headshot.frame;
        headshotFrame.origin.x = 50.0f;
        headshotFrame.origin.y = inset;
    headshot.frame = headshotFrame;
    [self.view addSubview:headshot];
    [self.view sendSubviewToBack:headshot];
    
    
    UITextView *infoTextView = [[UITextView alloc] init];
    CGRect infoTextFrame = CGRectZero;
        infoTextFrame.origin.x = inset;
        infoTextFrame.origin.y = headshotFrame.origin.y + headshotFrame.size.height + inset;
        infoTextFrame.size.width = self.view.frame.size.width - infoTextFrame.origin.x - inset;
        infoTextFrame.size.height = self.view.frame.size.height - infoTextFrame.origin.y - inset;
    infoTextView.frame = infoTextFrame;
    infoTextView.backgroundColor = [UIColor colorWithWhite:0.3f alpha:0.5f];
    infoTextView.editable = NO;
    infoTextView.font = [UIFont fontWithName:kSystemFontString size:18.0f];
    infoTextView.text = @"I am getting rid of this thing. It has caused me nothing but pride and self-respect. You're losing blood, aren't you? Probably, my socks are wet. The worst that could happen is that I could spill coffee all over this $3,000 suit. COME ON. What, so the guy we are meeting with can't even grow his own hair? COME ON!\n\nYou can control your bladder when you're dead! I don't care if it takes from now till the end of Shrimpfest. One of the guys told me to take my head out of my BOTTOM and get back to work…my BOTTOM! Hahahaha. And although the intervention didn't work, it turned into one of the Bluth family's better parties. ♪♪ Big yellow joint, big yellow joint, I'll meet you down at the big yellow joint. ♪♪ Great, now I'm gonna smell to high heaven like a tuna melt!\n\nYou're a good guy, mon frere. That means brother in French. I don't know how I know that. I took four years of Spanish. Stop it, stop it. This objectification of women has to stop. It's just Mom and whores. Saw this on the highway and almost blue myself. Hop on?";
    infoTextView.textColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    [self.view addSubview:infoTextView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

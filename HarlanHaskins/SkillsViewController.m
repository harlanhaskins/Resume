//
//  SkillsViewController.m
//  HarlanHaskins
//
//  Created by Harlan Haskins on 4/30/13.
//  Copyright (c) 2013 Valley Rocket. All rights reserved.
//

#import "SkillsViewController.h"
#import "ProgressView.h"

@interface SkillsViewController ()

@end

@implementation SkillsViewController
@synthesize skillsTableView;
@synthesize percentageDictionary;

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
    skillsTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    CGRect skillsTableViewFrame = skillsTableView.frame;
    skillsTableViewFrame.origin.x = kInset;
    skillsTableViewFrame.origin.y = (5 * kInset);
    skillsTableViewFrame.size.width = self.view.frame.size.width - (2 * kInset);
    skillsTableViewFrame.size.height = self.view.frame.size.height - skillsTableViewFrame.origin.y - kInset;
    skillsTableView.frame = skillsTableViewFrame;
    skillsTableView.backgroundColor = [UIColor clearColor];
    skillsTableView.separatorColor = [UIColor clearColor];
    skillsTableView.delegate = self;
    skillsTableView.dataSource = self;
    [self.view addSubview:skillsTableView];
    
    percentageDictionary = @{@"Cocoa" : @(80), @"Objective-C" : @(70), @"Java" : @(66), @"Photoshop" : @(76), @"JavaScript" : @(59), @"HTML" : @(50), @"InDesign" : @(65), @"Final Cut Pro" : @(69)};
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSString *skill = percentageDictionary.allKeys[indexPath.row];
        
        UILabel *itemLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.contentView.frame.size.width, cell.contentView.frame.size.height)];
        itemLabel.font = [UIFont fontWithName:kSystemFontString size:20.0f];
        itemLabel.backgroundColor = [UIColor clearColor];
        itemLabel.shadowColor = translucentShadowColor;
        itemLabel.shadowOffset = CGSizeMake(0, 1);
        itemLabel.textColor = whiteTextColor;
        itemLabel.text = skill;
        [cell.contentView addSubview:itemLabel];
        
        CGFloat percent = [(NSNumber*)[percentageDictionary objectForKey:skill] floatValue];
        
        CGRect progressViewFrame = cell.contentView.frame;
        progressViewFrame.size.height /= 2;
        progressViewFrame.size.width /= 2;
        progressViewFrame.origin.x = roundf(cell.contentView.frame.size.width / 2);
        
        ProgressView *progressView = [[ProgressView alloc] initWithFrame:progressViewFrame Percent:percent TintColor:redColor];
        
        CGPoint progressViewCenter = progressView.center;
        progressViewCenter.y = cell.contentView.center.y;
        progressView.center = progressViewCenter;
        
        [cell.contentView addSubview:progressView];
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

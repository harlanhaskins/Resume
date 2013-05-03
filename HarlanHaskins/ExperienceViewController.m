//
//  ExperienceViewController.m
//  HarlanHaskins
//
//  Created by Harlan Haskins on 5/1/13.
//  Copyright (c) 2013 Valley Rocket. All rights reserved.
//

#import "ExperienceViewController.h"

@interface ExperienceViewController ()

@end

@implementation ExperienceViewController {
    NSDictionary *experienceDictionary;
    NSDictionary *workDictionary;
}

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
    UITableView *experienceTableView = [[UITableView alloc] initWithFrame:CGRectMake(kInset, (5 * kInset), self.view.frame.size.width - (2 * kInset), self.view.frame.size.height - (6 * kInset)) style:UITableViewStylePlain];
    experienceTableView.delegate = self;
    experienceTableView.dataSource = self;
    experienceTableView.contentInset = UIEdgeInsetsMake(-10.0f, 0, 0, 0);
    experienceTableView.backgroundColor = [UIColor clearColor];
    experienceTableView.separatorColor = translucentShadowColor;
    
    experienceDictionary = @{@"0" : @[@"Wade Hampton High School", @"2009 - present", @"3.32 unweighted GPA. Twenty-one AP and Honors courses. Expected to graduate in June 2013. Notable classes include AP Computer Science, AP Calculus, Honors Physics, and Digital Media 1 & 2"], @"1" : @[@"Fine Arts Center", @"2010 - 2011", @"Digital Filmmaking Production course. Experience with Apple’s Pro media suite."], @"2" : @[@"Greer Cultural Arts Council", @"2013 (Volunteer)", @"Light technician, follow spot, and manager of light booth."], @"3" : @[@"Valley Rocket, LLC", @"2012 - present", @"iOS and web development. Helped develop iOS apps currently on the App Store, viewable in the Apps section of this app."], @"4" : @[@"That Awkward Stage Theatre Project", @"2012 - 2013 (Volunteer)", @"Directed a cast of 15 in Shakespeare’s ‘Taming of the Shrew’ for a local all-teen theatre organization. Also sang in an entirely teen-created musical."], @"5" : @[@"TEDxGreenville", @"2012 - 2013 (Volunteer)", @"Stagehand and Tech crew. Helped set up media and recording equipment."], @"6" : @[@"CaptionTech, Inc.", @"2011 - 2013", @"Server, networking, and computer maintenance for a local Closed Captioning business."], @"7" : @[@"Freelance Tech Support", @"2007 - present", @"In-depth Windows, OS X, and Linux experience. Built 7 custom computers for friends and family."]};
    
    [self.view addSubview:experienceTableView];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [self getTextHeightForIndexPath:indexPath] + 44.0f + (2 * kInset);
}

-(CGFloat) getTextHeightForIndexPath:(NSIndexPath*)indexPath {
    NSArray *textArray = [experienceDictionary objectForKey:[NSString stringWithFormat:@"%d", indexPath.row]];
    NSString *text = textArray[2];
    UIFont *font = [UIFont fontWithName:kSystemFontString size:18.0f];
    CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake((self.view.frame.size.width - (kInset * 2)), 1000.0f)];
    return size.height + 6.0f;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"ExperienceCell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    NSDictionary *currentDictionary = (indexPath.section == 0) ? experienceDictionary : workDictionary;
    NSArray *textArray = [currentDictionary objectForKey:[NSString stringWithFormat:@"%d", indexPath.row]];
    
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, cell.contentView.frame.size.width, 22.0f)];
    descriptionLabel.font = [UIFont fontWithName:kSystemFontString size:20.0f];
    descriptionLabel.backgroundColor = [UIColor clearColor];
    descriptionLabel.shadowColor = translucentShadowColor;
    descriptionLabel.shadowOffset = CGSizeMake(0, 1);
    descriptionLabel.textColor = whiteTextColor;
    descriptionLabel.text = textArray[0];
    
    if ([descriptionLabel.text isEqualToString:@"That Awkward Stage Theatre Project"]) {
        descriptionLabel.font = [UIFont fontWithName:kSystemFontString size:18.0f];
    }
    
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:descriptionLabel.frame];
    CGRect timeLabelFrame = timeLabel.frame;
    timeLabelFrame.origin.y += timeLabelFrame.size.height + 5.0f;
    timeLabel.frame = timeLabelFrame;
    timeLabel.font = [UIFont fontWithName:kSystemFontString size:18.0f];
    timeLabel.backgroundColor = [UIColor clearColor];
    timeLabel.shadowColor = translucentShadowColor;
    timeLabel.shadowOffset = CGSizeMake(0, 1);
    timeLabel.textColor = [whiteTextColor colorWithAlphaComponent:0.7];
    timeLabel.text = textArray[1];
    
    UITextView *infoText = [[UITextView alloc] initWithFrame:CGRectMake(-7, (timeLabelFrame.origin.y + timeLabelFrame.size.height - 4.0f), cell.contentView.frame.size.width, [self getTextHeightForIndexPath:indexPath])];
    infoText.backgroundColor = [UIColor clearColor];
    infoText.editable = NO;
    infoText.font = [UIFont fontWithName:kSystemFontString size:18.0f];
    infoText.textColor = whiteTextColor;
    infoText.text = textArray[2];
    infoText.scrollEnabled = NO;
    
    [cell.contentView addSubview:descriptionLabel];
    [cell.contentView addSubview:timeLabel];
    [cell.contentView addSubview:infoText];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

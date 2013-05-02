//
//  MainMenuViewController.m
//  Haskins
//
//  Created by Harlan Haskins on 4/27/13.
//  Copyright (c) 2013 Valley Rocket. All rights reserved.
//

#import "MainMenuViewController.h"
#import "AppsViewController.h"
#import "BioViewController.h"
#import "ExperienceViewController.h"
#import "ThanksViewController.h"
#import "SkillsViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"MenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        
        UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:cell.contentView.frame];
        selectedBackgroundView.backgroundColor = redColor;
        cell.selectedBackgroundView = selectedBackgroundView;
        
        UIImageView *arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"redarrow.png"] highlightedImage:[UIImage imageNamed:@"arrow.png"]];
        CGRect arrowFrame = arrow.frame;
        arrowFrame.origin.x = cell.contentView.frame.size.width - (30 + arrowFrame.size.width);
        arrowFrame.origin.y = roundf((cell.contentView.frame.size.height - arrowFrame.size.height) / 2) + 2;
        arrow.frame = arrowFrame;
        [cell.contentView addSubview:arrow];
        
        UILabel *itemLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 4 , cell.frame.size.width, cell.frame.size.height)];
         
        itemLabel.font = [UIFont fontWithName:kSystemFontString size:20.0f];
        itemLabel.backgroundColor = [UIColor clearColor];
        itemLabel.shadowColor = translucentShadowColor;
        itemLabel.shadowOffset = CGSizeMake(0, 1);
        itemLabel.textColor = whiteTextColor;
        
        switch (indexPath.row) {
            case 0:
                itemLabel.text = @"APPS";
                break;
            case 1:
                itemLabel.text = @"BIO";
                break;
            case 2:
                itemLabel.text = @"SKILLS";
                break;
            case 3:
                itemLabel.text = @"WORK & EDUCATION";
                break;
            case 4:
                itemLabel.text = @"RÈSUMÈ";
                break;
            case 5:
                itemLabel.text = @"SPECIAL THANKS";
                break;
        }
        [cell.contentView addSubview:itemLabel];
    }
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UIImageView *arrow = cell.contentView.subviews[0];
    [arrow setHighlighted:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    DetailViewController *selectedController;
    NSString *title = [(UILabel*)cell.contentView.subviews[1] text];
    switch (indexPath.row) {
        case 0:
            selectedController = [[AppsViewController alloc] init];
            break;
        case 1:
            selectedController = [[BioViewController alloc] initWithTitle:title];
            break;
        case 2:
            selectedController = [[SkillsViewController alloc] initWithTitle:title];
            break;
        case 3:
            selectedController = [[ExperienceViewController alloc] initWithTitle:title];
            break;
        case 4:
            [self openActionSheet];
            break;
        case 5:
            selectedController = [[ThanksViewController alloc] initWithTitle:title];
            break;
    }
    if (selectedController) {
        [self.navigationController pushViewController:selectedController animated:YES];
    }
}

-(void) openActionSheet {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Open in Safari", nil];
    [actionSheet showInView:self.view];
}

-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (!buttonIndex) {
        NSURL *url = [NSURL URLWithString:@"http://www.harlanhaskins.com/Resume.pdf"];
        
        if (![[UIApplication sharedApplication] openURL:url]) {
            NSLog(@"%@%@", @"Failed to open url:", [url description]);
        }
    }
}

-(void) tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UIImageView *arrow = cell.contentView.subviews[0];
    [arrow setHighlighted:NO];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    _nameLabel.shadowColor = _infoLabel.shadowColor = translucentShadowColor;
    _nameLabel.textColor = _infoLabel.textColor = whiteTextColor;
    [_infoLabel setKerning:4.33];
    [self.view setBackgroundColor:grayColor];
    [self.stripeView setBackgroundColor:redColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

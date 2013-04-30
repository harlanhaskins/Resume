//
//  MainMenuViewController.m
//  HarlanHaskins
//
//  Created by Harlan Haskins on 4/27/13.
//  Copyright (c) 2013 Valley Rocket. All rights reserved.
//

#import "MainMenuViewController.h"
#import "AppsViewController.h"
#import "BioViewController.h"

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
        itemLabel.shadowColor = redShadowColor;
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
                itemLabel.text = @"EXPERIENCE";
                break;
            case 4:
                itemLabel.text = @"RÈSUMÈ";
                break;
            case 5:
                itemLabel.text = @"CONTACT";
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
    UIViewController *selectedController;
    switch (indexPath.row) {
        case 0:
            selectedController = [[AppsViewController alloc] init];
            break;
        case 1:
            selectedController = [[BioViewController alloc] init];
            break;
        case 2:
            break;
        case 3:
            break;
        case 4:
            break;
        case 5:
            break;
    }
    
    if (selectedController) {
        [self.navigationController pushViewController:selectedController animated:YES];
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
    _nameLabel.shadowColor = _infoLabel.shadowColor = redShadowColor;
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

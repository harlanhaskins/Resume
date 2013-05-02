//
//  IntroViewController.m
//  HarlanHaskins
//
//  Created by Harlan Haskins on 4/30/13.
//  Copyright (c) 2013 Valley Rocket. All rights reserved.
//

#import "IntroViewController.h"
#import "MainMenuViewController.h"

@interface IntroViewController ()

@end

@implementation IntroViewController {
    UIView *infoView;
    UIColor *lightWhite;
}
@synthesize mrButton;
@synthesize mrsButton;
@synthesize msButton;
@synthesize firstNameTextField;
@synthesize lastNameTextField;


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
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"InfoView" owner:self options:nil];
    infoView = views[0];
    CGRect infoViewFrame = infoView.frame;
    infoViewFrame.origin.y = (10 * kInset);
    infoViewFrame.origin.x = kInset;
    infoView.frame = infoViewFrame;
    [self.view addSubview:infoView];
    
    self.view.backgroundColor = grayColor;
    
    lightWhite = [UIColor colorWithWhite:0.75 alpha:1.0];
    
    mrsButton.titleLabel.textColor = lightWhite;
    msButton.titleLabel.textColor = lightWhite;
    
    firstNameTextField.delegate = self;
    lastNameTextField.delegate = self;
	// Do any additional setup after loading the view.
}

- (IBAction)titleButtonPressed:(id)sender {
    UIButton *titleButton = (UIButton*)sender;
    mrButton.titleLabel.textColor = lightWhite;
    mrButton.tag = 0;
    msButton.titleLabel.textColor = lightWhite;
    msButton.tag = 0;
    mrsButton.titleLabel.textColor = lightWhite;
    mrsButton.tag = 0;
    titleButton.titleLabel.textColor = grayColor;
    titleButton.tag = 1;
}

- (IBAction)buttonPressed:(id)sender {
    
    NSString *title;
    if (mrButton.tag == 1 && msButton.tag == 1 && mrsButton.tag == 1) {
        title = @"";
    }
    else if (mrButton.tag == 1) {
        title = @"Mr. ";
    }
    else if (mrsButton.tag == 1) {
        title = @"Mrs. ";
    }
    else if (msButton.tag == 1) {
        title = @"Ms. ";
    }
    
    NSString *lastName = lastNameTextField.text;
    
    NSString *firstName = ([lastName isEqualToString:@""] || [firstNameTextField.text isEqualToString:@""]) ? firstNameTextField.text : [firstNameTextField.text stringByAppendingString:@" "];
    
    firstName = ([firstName isEqualToString:@" "]) ? @"" : firstName;
    lastName = ([lastName isEqualToString:@" "]) ? @"" : lastName;
    
    NSString *fullName = [NSString stringWithFormat:@"%@%@%@", title, firstName, lastName];
    
    fullName = ([fullName isEqualToString:@""]) ? @"anonymous Apple reviewer" : fullName;
    
    NSDictionary *nameDictionary = @{@"fullName" : fullName};
    
    NSURL *url = kNamePlistURL;
    
    BOOL success = [nameDictionary writeToFile:url.path atomically:YES];
    NSLog(@"%@ - %hhd", url.path, success);
    
    [self.navigationController pushViewController:[[MainMenuViewController alloc] init] animated:YES];
}

-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    CGRect infoViewFrame = infoView.frame;
    infoViewFrame.origin.y = roundf(((self.view.frame.size.height - 216) / 2) - (infoViewFrame.size.height / 2));
    [UIView animateWithDuration:0.25 animations:^{
        infoView.frame = infoViewFrame;
    }];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  SkillsViewController.h
//  HarlanHaskins
//
//  Created by Harlan Haskins on 4/30/13.
//  Copyright (c) 2013 Valley Rocket. All rights reserved.
//

#import "DetailViewController.h"

@interface SkillsViewController : DetailViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *skillsTableView;
@property (strong, nonatomic) NSDictionary *percentageDictionary;
@end

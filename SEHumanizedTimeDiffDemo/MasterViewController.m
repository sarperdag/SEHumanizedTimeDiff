//
//  MasterViewController.m
//  SEHumanizedTimeDiffDemo
//
//  Created by Rousseau Quentin on 24/11/12.
//  Copyright (c) 2012 Rousseau Quentin. All rights reserved.
//

#import "MasterViewController.h"
#import <UIKit/UIView.h>

@implementation MasterViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.view.frame = [[UIScreen mainScreen] bounds];
  self.view.backgroundColor = [UIColor whiteColor];
  
  items = [NSArray arrayWithObjects:
  [NSDate dateWithTimeIntervalSinceNow:-10],
  [NSDate dateWithTimeIntervalSinceNow:-60],
  [NSDate dateWithTimeIntervalSinceNow:-360],
  [NSDate dateWithTimeIntervalSinceNow:-3600],
  [NSDate dateWithTimeIntervalSinceNow:-10800],
  [NSDate dateWithTimeIntervalSinceNow:-3600*24],
  [NSDate dateWithTimeIntervalSinceNow:-3600*24*5],
  [NSDate dateWithTimeIntervalSinceNow:-3600*24*365],
  [NSDate dateWithTimeIntervalSinceNow:-3600*24*1000],
  nil];
  
  UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
  
  switchControl = [[UISwitch alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 100, 10, 100, 50)];
  
  [switchControl addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
  
  segmentedControl = [[UISegmentedControl  alloc] initWithItems:[NSArray arrayWithObjects:@"None",@"Left",@"Ago", nil]];
  segmentedControl.frame = CGRectMake(0, 0, self.view.frame.size.width/1.5, 50);
  [segmentedControl addTarget:self
                       action:@selector(segmentedAction:)
             forControlEvents:UIControlEventValueChanged];
  segmentedControl.selectedSegmentIndex = 0;
  
  [headerView addSubview:segmentedControl];
  [headerView addSubview:switchControl];
  
  [self.tableView setTableHeaderView:headerView];
  [self.tableView reloadData];
}

- (void)segmentedAction:(id)sender
{
  switch (segmentedControl.selectedSegmentIndex)
  {
    case 0:
      humanizedType = NSDateHumanizedSuffixNone;
      break;
    case 1:
      humanizedType = NSDateHumanizedSuffixLeft;
      break;
    case 2:
      humanizedType = NSDateHumanizedSuffixAgo;
      break;
  }
  [self.tableView reloadData];
}

- (void)switchAction:(id)sender
{
  [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  if (cell == nil)
  {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  }
  
  NSDate *date = [items  objectAtIndex:indexPath.row];
  [cell.textLabel setText:[date stringWithHumanizedTimeDifference:humanizedType withFullString:switchControl.on]];
  [cell.textLabel setTextColor:[UIColor blackColor]];

  return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [items count];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

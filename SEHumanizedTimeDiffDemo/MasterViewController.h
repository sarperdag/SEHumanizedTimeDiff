//
//  MasterViewController.h
//  SEHumanizedTimeDiffDemo
//
//  Created by Rousseau Quentin on 24/11/12.
//  Copyright (c) 2012 Rousseau Quentin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSDate+HumanizedTime.h"

@interface MasterViewController : UITableViewController
{
  UISegmentedControl  *segmentedControl;
  UISwitch            *switchControl;
  NSMutableArray      *items;
  NSDateHumanizedType humanizedType;
}

@end

//
//  ViewController.m
//  HumanizedTimeDemo
//
//  Created by Sarp Erdag on 2/29/12.
//  Copyright (c) 2012 Sarp Erdag. All rights reserved.
//

#import "ViewController.h"
#import "NSDate+HumanizedTime.h"

@implementation ViewController


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDate *now = [NSDate date];
	NSDateFormatter *formatter = nil;
	formatter = [[NSDateFormatter alloc] init];
	[formatter setTimeStyle:NSDateFormatterShortStyle];
	[timeNowLabel setText:[formatter stringFromDate:now]];
	[formatter release];
    
    secondsLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-10] getHumanizedTimeDifference];
    aMinuteLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-60] getHumanizedTimeDifference];
    minutesLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-360] getHumanizedTimeDifference];
    anHourLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-3600] getHumanizedTimeDifference];
    hoursLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-10800] getHumanizedTimeDifference];
    aDayLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-3600*24] getHumanizedTimeDifference];
    daysLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-3600*24*5] getHumanizedTimeDifference];
    aYearLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-3600*24*365] getHumanizedTimeDifference];
    yearsLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-3600*24*1000] getHumanizedTimeDifference];
}



@end

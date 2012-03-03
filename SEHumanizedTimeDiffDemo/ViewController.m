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
    
    secondsLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-10] stringWithHumanizedTimeDifference];
    aMinuteLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-60] stringWithHumanizedTimeDifference];
    minutesLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-360] stringWithHumanizedTimeDifference];
    anHourLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-3600] stringWithHumanizedTimeDifference];
    hoursLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-10800] stringWithHumanizedTimeDifference];
    aDayLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-3600*24] stringWithHumanizedTimeDifference];
    daysLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-3600*24*5] stringWithHumanizedTimeDifference];
    aYearLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-3600*24*365] stringWithHumanizedTimeDifference];
    yearsLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-3600*24*1000] stringWithHumanizedTimeDifference];
}



@end

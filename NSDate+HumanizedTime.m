//
//  NSDate+HumanizedTime.m
//  HumanizedTimeDemo
//
//  Created by Sarp Erdag on 2/29/12.
//  Copyright (c) 2012 Sarp Erdag. All rights reserved.
//

#import "NSDate+HumanizedTime.h"

@implementation NSDate (HumanizedTime)

- (NSString *) stringWithHumanizedTimeDifference {
    
    NSTimeInterval timeInterval = [self timeIntervalSinceNow];
    
    int secondsInADay = 3600*24;
    int secondsInAYear = 3600*24*365;
    int yearsDiff = abs(timeInterval/secondsInAYear); 
    int daysDiff = abs(timeInterval/secondsInADay);
    int hoursDiff = abs((abs(timeInterval) - (daysDiff * secondsInADay)) / 3600);
    int minutesDiff = abs((abs(timeInterval) - ((daysDiff * secondsInADay) + (hoursDiff * 60))) / 60);
    //int secondsDiff = (abs(timeInterval) - ((daysDiff * secondsInADay) + (hoursDiff * 3600) + (minutesDiff * 60)));
    
    NSString *positivity = [NSString stringWithFormat:@"%@", timeInterval < 0 ? NSLocalizedString(@"AgoKey", @""):NSLocalizedString(@"LaterKey", @"")];
    
    if (yearsDiff > 1)
        return [NSString stringWithFormat:@"%d %@ %@", yearsDiff, NSLocalizedString(@"YearsKey", @""), positivity];
    else if (yearsDiff == 1)
        return [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"YearKey", @""), positivity];
    
    if (daysDiff > 0) {
        if (hoursDiff == 0)
            return [NSString stringWithFormat:@"%d %@ %@", daysDiff, daysDiff == 1 ? NSLocalizedString(@"DayKey", @""):NSLocalizedString(@"DaysKey", @""), positivity];
        else
            return [NSString stringWithFormat:@"%d %@ %d %@ %@", daysDiff, daysDiff == 1 ? NSLocalizedString(@"DayKey", @""):NSLocalizedString(@"DaysKey", @""), hoursDiff, NSLocalizedString(@"HoursKey", @""), positivity];
    }
    else {
        if (hoursDiff == 0) {
            if (minutesDiff == 0)
                return [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"SecondKey", @""), positivity];
            else 
                return [NSString stringWithFormat:@"%d %@ %@", minutesDiff, minutesDiff == 1 ? NSLocalizedString(@"MinuteKey", @""):NSLocalizedString(@"MinutesKey", @""), positivity];
        }
        else {
            if (hoursDiff == 1)
                return [NSString stringWithFormat:@"%@ %@ %@", NSLocalizedString(@"AboutKey", @""), NSLocalizedString(@"HourKey", @""), positivity];
            else
                return [NSString stringWithFormat:@"%d %@ %@", hoursDiff, NSLocalizedString(@"HoursKey", @""), positivity];
        }
    }
}

@end
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
    
    
    //Some languages don't need whitespeces between words.
    NSArray *languagesWithNoSpace = [NSArray arrayWithObjects:@"zh-Hans",@"ja", nil];
    NSString* spaceBetweenWords = @" ";
    for (NSString* languageWithNoSpace in languagesWithNoSpace) {
        if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:languageWithNoSpace]) {
            spaceBetweenWords = @"";
        }
    }
    
    if (yearsDiff > 1)
        return [NSString stringWithFormat:@"%d%@%@%@%@", yearsDiff, spaceBetweenWords, NSLocalizedString(@"YearsKey", @""), spaceBetweenWords, positivity];
    else if (yearsDiff == 1)
        return [NSString stringWithFormat:@"%@%@%@", NSLocalizedString(@"YearKey", @""), spaceBetweenWords, positivity];
    
    if (daysDiff > 0) {
        if (hoursDiff == 0)
            return [NSString stringWithFormat:@"%d%@%@%@%@", daysDiff, spaceBetweenWords, daysDiff == 1 ? NSLocalizedString(@"DayKey", @""):NSLocalizedString(@"DaysKey", @""), spaceBetweenWords, positivity];
        else
            return [NSString stringWithFormat:@"%d%@%@%@%d%@%@%@%@", daysDiff, spaceBetweenWords, daysDiff == 1 ? NSLocalizedString(@"DayKey", @""):NSLocalizedString(@"DaysKey", @""), spaceBetweenWords, hoursDiff, spaceBetweenWords, NSLocalizedString(@"HoursKey", @""), spaceBetweenWords, positivity];
    }
    else {
        if (hoursDiff == 0) {
            if (minutesDiff == 0)
                return [NSString stringWithFormat:@"%@%@%@", NSLocalizedString(@"SecondKey", @""), spaceBetweenWords, positivity];
            else 
                return [NSString stringWithFormat:@"%d%@%@%@%@", minutesDiff, spaceBetweenWords, minutesDiff == 1 ? NSLocalizedString(@"MinuteKey", @""):NSLocalizedString(@"MinutesKey", @""), spaceBetweenWords, positivity];
        }
        else {
            if (hoursDiff == 1)
                return [NSString stringWithFormat:@"%@%@%@%@%@", NSLocalizedString(@"AboutKey", @""), spaceBetweenWords, NSLocalizedString(@"HourKey", @""), spaceBetweenWords, positivity];
            else
                return [NSString stringWithFormat:@"%d%@%@%@%@", hoursDiff, spaceBetweenWords, NSLocalizedString(@"HoursKey", @""), spaceBetweenWords, positivity];
        }
    }
}

@end
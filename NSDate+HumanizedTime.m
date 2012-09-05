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
    int secondsInAWeek =  3600*24*7;
    int secondsInAMonth =  3600*24*30; //To fix, not precise
    int secondsInAYear = 3600*24*365;
    int yearsDiff = abs(timeInterval/secondsInAYear);
    int monthsDiff = abs(timeInterval/secondsInAMonth);
    int weeksDiff = abs(timeInterval/secondsInAWeek);
    int daysDiff = abs(timeInterval/secondsInADay);
    int hoursDiff = abs((abs(timeInterval) - (daysDiff * secondsInADay)) / 3600);
    int minutesDiff = abs((abs(timeInterval) - ((daysDiff * secondsInADay) + (hoursDiff * 60))) / 60);
    
    if (yearsDiff > 1)
    {
         NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
         dateFormatter.dateFormat = @"YYYY-MM-dd";
         return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:timeInterval]];
    }
  
    if (monthsDiff > 0)
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"dd MMM";
        return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:timeInterval]];
     }
    else
    {
        if (weeksDiff > 0)
          return [NSString stringWithFormat:@"%d%@", weeksDiff, NSLocalizedString(@"WeekKey", @"")];
        else
        {
          if (daysDiff > 0) {
              return [NSString stringWithFormat:@"%d%@", daysDiff, NSLocalizedString(@"DayKey", @"")];
          }
          else 
          {
            if (hoursDiff == 0) {
                if (minutesDiff == 0)
                    return [NSString stringWithFormat:@"%@", NSLocalizedString(@"SecondKey", @"")];
                else 
                    return [NSString stringWithFormat:@"%d%@", minutesDiff, NSLocalizedString(@"MinuteKey", @"")];
            }
            else {
                if (hoursDiff == 1)
                    return [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"AboutKey", @""), NSLocalizedString(@"HourKey", @"")];
                else
                    return [NSString stringWithFormat:@"%d%@", hoursDiff, NSLocalizedString(@"HourKey", @"")];
                  }
            }
        }
    }
}

@end
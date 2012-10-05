//
//  NSDate+HumanizedTime.m
//  HumanizedTimeDemo
//
//  Created by Sarp Erdag on 2/29/12.
//  Copyright (c) 2012 Sarp Erdag. All rights reserved.
//

#import "NSDate+HumanizedTime.h"

#define LOCALISABLE_FULL @"Localizable_full"
#define LOCALISABLE_FULL_UNTIL @"Until"
#define LOCALISABLE_FULL_LEFT @"left"

@implementation NSDate (HumanizedTime)

- (NSString *) stringWithHumanizedTimeDifference
{
  return [self stringWithHumanizedTimeDifference:NO];
}

- (NSString *) stringWithHumanizedTimeDifference:(bool) fullStrings
{   
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
    int secondsDiff = abs((abs(timeInterval) - ((daysDiff * secondsInADay) + (minutesDiff * 60))));
    
    if (yearsDiff > 1)
    {
         NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
         dateFormatter.dateFormat = @"YYYY-MM-dd";
         if (fullStrings)
           return [NSString stringWithFormat:@"%@ %@", LOCALISABLE_FULL_UNTIL, [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:timeInterval]]];
         else
           return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:timeInterval]];
    }
  
    if (monthsDiff > 0)
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"dd MMM";
        if (fullStrings)
          return [NSString stringWithFormat:@"%@ %@", LOCALISABLE_FULL_UNTIL, [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:timeInterval]]];
        else
          return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:timeInterval]];
     }
    else
    {
        if (weeksDiff > 0)
        {
          if (fullStrings)
            return [NSString stringWithFormat:@"%d %@%@ %@", weeksDiff,  NSLocalizedStringFromTable(@"WeekKey", LOCALISABLE_FULL, @""), (weeksDiff == 1 ? @"" : @"s"), LOCALISABLE_FULL_LEFT];
          else
            return [NSString stringWithFormat:@"%d%@", weeksDiff, NSLocalizedString(@"WeekKey", @"")];
        }
        else
        {
          if (daysDiff > 0){
            if (fullStrings)
              return [NSString stringWithFormat:@"%d %@%@ %@", daysDiff, NSLocalizedStringFromTable(@"DayKey", LOCALISABLE_FULL, @""),  (daysDiff == 1 ? @"" : @"s"), LOCALISABLE_FULL_LEFT];
            else
              return [NSString stringWithFormat:@"%d%@", daysDiff, NSLocalizedString(@"DayKey", @"")];
          }
          else 
          {
            if (hoursDiff == 0) {
                if (minutesDiff == 0)
                  if (fullStrings)
                    return [NSString stringWithFormat:@"%d %@s %@", secondsDiff, NSLocalizedStringFromTable(@"SecondKey", LOCALISABLE_FULL, @""), LOCALISABLE_FULL_LEFT];
                  else
                    return [NSString stringWithFormat:@"%@", NSLocalizedString(@"SecondKey", @"")];
                else
                  if (fullStrings)
                    return [NSString stringWithFormat:@"%d %@%@ %@", minutesDiff, NSLocalizedStringFromTable(@"MinuteKey", LOCALISABLE_FULL, @""), (minutesDiff == 1 ? @"" : @"s"), LOCALISABLE_FULL_LEFT];
                  else
                    return [NSString stringWithFormat:@"%d%@", minutesDiff, NSLocalizedString(@"MinuteKey", @"")];
            }
            else {
                if (hoursDiff == 1)
                    return [NSString stringWithFormat:@"%@ 1%@", NSLocalizedString(@"AboutKey", @""), NSLocalizedString(@"HourKey", @"")];
                else
                  if (fullStrings)
                    return [NSString stringWithFormat:@"%d %@%@ %@", hoursDiff, NSLocalizedStringFromTable(@"HourKey", LOCALISABLE_FULL, @""), (hoursDiff == 1 ? @"" : @"s"), LOCALISABLE_FULL_LEFT];
                  else
                    return [NSString stringWithFormat:@"%d%@", hoursDiff, NSLocalizedString(@"HourKey", @"")];
                  }
            }
        }
    }
}

@end

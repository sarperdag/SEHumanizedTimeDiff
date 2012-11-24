//
//  NSDate+HumanizedTime.m
//  HumanizedTimeDemo
//
//  Created by Sarp Erdag on 2/29/12.
//  Copyright (c) 2012 Sarp Erdag. All rights reserved.
//

#import "NSDate+HumanizedTime.h"

#define LOCALISABLE_FULL @"Localizable_full"
#define LOCALISABLE_SHORT @"Localizable"
#define SUFFIX_UNTIL @"Until"
#define PREFIX_LEFT @"left"
#define PREFIX_AGO  @"ago"

@implementation NSDate (HumanizedTime)

- (NSString *) stringWithHumanizedTimeDifference:(NSDateHumanizedType) humanizedType withFullString:(BOOL) fullStrings
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
  
    NSString *yearString;
    NSString *dateString;
    NSString *weekString;
    NSString *dayString;
    NSString *hourString;
    NSString *minuteString;
    NSString *secondString;
  
    NSDateFormatter *yearDateFormatter = [[NSDateFormatter alloc] init];
    yearDateFormatter.dateFormat = @"YYYY-MM-dd";
  
    NSDateFormatter *dateDateFormatter = [[NSDateFormatter alloc] init];
    dateDateFormatter.dateFormat = @"dd MMM";
  
    NSString *translation_table = (fullStrings) ? LOCALISABLE_FULL : LOCALISABLE_SHORT;
  
    switch (humanizedType)
    {
      case NSDateHumanizedSuffixNone:
      {
        yearString   = [yearDateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:timeInterval]];
        dateString   = [dateDateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:timeInterval]];
        weekString   = [NSString stringWithFormat:@"%d%@", weeksDiff, NSLocalizedStringFromTable(@"WeekKey", translation_table, @"")];
        dayString    = [NSString stringWithFormat:@"%d%@", daysDiff, NSLocalizedStringFromTable(@"DayKey", translation_table, @"")];
        hourString   = [NSString stringWithFormat:@"%d%@", hoursDiff, NSLocalizedStringFromTable(@"HourKey", translation_table, @"")];
        minuteString = [NSString stringWithFormat:@"%d%@", minutesDiff, NSLocalizedStringFromTable(@"MinuteKey", translation_table, @"")];
        secondString = [NSString stringWithFormat:@"%@", NSLocalizedStringFromTable(@"SecondKey", translation_table, @"")];
        break;
      }
      case NSDateHumanizedSuffixLeft:
      {
        yearString = [NSString stringWithFormat:@"%@ %@", SUFFIX_UNTIL, [yearDateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:timeInterval]]];
        dateString = [NSString stringWithFormat:@"%@ %@", SUFFIX_UNTIL, [dateDateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:timeInterval]]];
        weekString   = [NSString stringWithFormat:@"%d %@%@ %@", weeksDiff,  NSLocalizedStringFromTable(@"WeekKey", translation_table, @""), (weeksDiff == 1 ? @"" : @"s"), PREFIX_LEFT];
        dayString    = [NSString stringWithFormat:@"%d %@%@ %@", daysDiff, NSLocalizedStringFromTable(@"DayKey", translation_table, @""),  (daysDiff == 1 ? @"" : @"s"), PREFIX_LEFT];
        hourString   = [NSString stringWithFormat:@"%d %@%@ %@", hoursDiff, NSLocalizedStringFromTable(@"HourKey", translation_table, @""), (hoursDiff == 1 ? @"" : @"s"), PREFIX_LEFT];
        minuteString = [NSString stringWithFormat:@"%d %@%@ %@", minutesDiff, NSLocalizedStringFromTable(@"MinuteKey", translation_table, @""), (minutesDiff == 1 ? @"" : @"s"), PREFIX_LEFT];
        secondString = [NSString stringWithFormat:@"%d %@s %@", secondsDiff, NSLocalizedStringFromTable(@"SecondKey", translation_table, @""), PREFIX_LEFT];

        break;
      }
      case NSDateHumanizedSuffixAgo:
      {
        yearString = [yearDateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:timeInterval]];
        dateString = [[dateDateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:timeInterval]] stringByAppendingString:@"."];
        weekString   = [NSString stringWithFormat:@"%d %@%@ %@", weeksDiff,  NSLocalizedStringFromTable(@"WeekKey", translation_table, @""), (weeksDiff == 1 ? @"" : @"s"), PREFIX_AGO];
        dayString    = [NSString stringWithFormat:@"%d %@%@ %@", daysDiff, NSLocalizedStringFromTable(@"DayKey", translation_table, @""),  (daysDiff == 1 ? @"" : @"s"), PREFIX_AGO];
        hourString   = [NSString stringWithFormat:@"%d %@%@ %@", hoursDiff, NSLocalizedStringFromTable(@"HourKey", translation_table, @""), (hoursDiff == 1 ? @"" : @"s"), PREFIX_AGO];
        minuteString = [NSString stringWithFormat:@"%d %@%@ %@", minutesDiff, NSLocalizedStringFromTable(@"MinuteKey", translation_table, @""), (minutesDiff == 1 ? @"" : @"s"), PREFIX_AGO];
        secondString = [NSString stringWithFormat:@"%d %@s %@", secondsDiff, NSLocalizedStringFromTable(@"SecondKey", translation_table, @""), PREFIX_AGO];
        break;
      }
    }
  
    if (yearsDiff > 1)
    {
      return yearString;
    }
  
    if (monthsDiff > 0)
    {
      return dateString;
    }
    else
    {
        if (weeksDiff > 0)
        {
          return weekString;
        }
        else
        {
          if (daysDiff > 0)
          {
            return dayString;
          }
          else 
          {
            if (hoursDiff == 0)
            {
                if (minutesDiff == 0)
                  return secondString;
                else
                  return minuteString;
            }
            else
            {
                if (hoursDiff == 1)
                    return [NSString stringWithFormat:@"%@ 1%@", NSLocalizedString(@"AboutKey", @""), NSLocalizedString(@"HourKey", @"")];
                else
                  return hourString;
            }
          }
      }
  }
}

@end

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
#define SUFFIX_UNTIL @"Until the "
#define PREFIX_LEFT @" left"
#define PREFIX_AGO  @" ago"

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
    NSString *full_yearString;
    NSString *full_dateString;
    NSString *full_weekString;
    NSString *full_dayString;
    NSString *full_hourString;
    NSString *full_minuteString;
    NSString *full_secondString;
  
    NSDateFormatter *yearDateFormatter = [[NSDateFormatter alloc] init];
    yearDateFormatter.dateFormat = @"YYYY-MM-dd";
  
    NSDateFormatter *full_yearDateFormatter = [[NSDateFormatter alloc] init];
    full_yearDateFormatter.dateFormat = @"YYYY-MM-dd";
  
    NSDateFormatter *dateDateFormatter = [[NSDateFormatter alloc] init];
    dateDateFormatter.dateFormat = @"dd MMM.";
  
    NSDateFormatter *full_dateDateFormatter = [[NSDateFormatter alloc] init];
    full_dateDateFormatter.dateFormat = @"dd MMMM";

    NSDateFormatter *dayFormatter = [[NSDateFormatter alloc] init];
    [dayFormatter setDateFormat: (fullStrings) ? @"EEEE" : @"EEE"];

    NSString *translation_table = (fullStrings) ? LOCALISABLE_FULL : LOCALISABLE_SHORT;
  
    //NSDateHumanizedSuffixNone
    yearString   = [yearDateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:timeInterval]];
    dateString   = [dateDateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:timeInterval]];
    weekString   = [NSString stringWithFormat:@"%d%@", weeksDiff, NSLocalizedStringFromTable(@"WeekKey", translation_table, @"")];
    dayString    = [NSString stringWithFormat:@"%d%@", daysDiff, NSLocalizedStringFromTable(@"DayKey", translation_table, @"")];
    hourString   = [NSString stringWithFormat:@"%d%@", hoursDiff, NSLocalizedStringFromTable(@"HourKey", translation_table, @"")];
    minuteString = [NSString stringWithFormat:@"%d%@", minutesDiff, NSLocalizedStringFromTable(@"MinuteKey", translation_table, @"")];
    secondString = [NSString stringWithFormat:@"%d%@", secondsDiff, NSLocalizedStringFromTable(@"SecondKey", translation_table, @"")];
    
    full_yearString   = [full_yearDateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:timeInterval]];
    full_dateString   = [full_dateDateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:timeInterval]];
    full_weekString   = [NSString stringWithFormat:@"%d %@%@", weeksDiff,
                         NSLocalizedStringFromTable(@"WeekKey", translation_table, @""),
                         (weeksDiff == 1) ? @"" : @"s"];
    full_dayString    = [NSString stringWithFormat:@"%d %@%@", daysDiff,
                         NSLocalizedStringFromTable(@"DayKey", translation_table, @""),
                         (daysDiff == 1) ? @"" : @"s"];
    full_hourString   = [NSString stringWithFormat:@"%d %@%@", hoursDiff,
                         NSLocalizedStringFromTable(@"HourKey", translation_table, @""),
                         (hoursDiff == 1) ? @"" : @"s"];
    full_minuteString = [NSString stringWithFormat:@"%d %@%@", minutesDiff,
                         NSLocalizedStringFromTable(@"MinuteKey", translation_table, @""),
                         (minutesDiff == 1) ? @"" : @"s"];
    full_secondString = [NSString stringWithFormat:@"%d %@%@", secondsDiff,
                         NSLocalizedStringFromTable(@"SecondKey", translation_table, @""),
                         (secondsDiff == 1) ? @"" : @"s"];
  
    switch (humanizedType)
    {
      default: break;
      case NSDateHumanizedSuffixLeft:
      {
        if(!fullStrings)
        {
          yearString   = [SUFFIX_UNTIL stringByAppendingString:yearString];
          dateString   = [SUFFIX_UNTIL stringByAppendingString:dateString];
          weekString   = [weekString stringByAppendingString:PREFIX_LEFT];
          dayString    = [dayString stringByAppendingString:PREFIX_LEFT];
          hourString   = [hourString stringByAppendingString:PREFIX_LEFT];
          minuteString = [minuteString stringByAppendingString:PREFIX_LEFT];
          secondString = [secondString stringByAppendingString:PREFIX_LEFT];
        }
        else
        {
          full_yearString   = [SUFFIX_UNTIL stringByAppendingString:full_yearString];
          full_dateString   = [SUFFIX_UNTIL stringByAppendingString:full_dateString];
          full_weekString   = [full_weekString stringByAppendingString:PREFIX_LEFT];
          full_dayString    = [full_dayString stringByAppendingString:PREFIX_LEFT];
          full_hourString   = [full_hourString stringByAppendingString:PREFIX_LEFT];
          full_minuteString = [full_minuteString stringByAppendingString:PREFIX_LEFT];
          full_secondString = [full_secondString stringByAppendingString:PREFIX_LEFT];
        }
        break;
      }
      case NSDateHumanizedSuffixAgo:
      {
        if(!fullStrings)
        {
          weekString   = [weekString stringByAppendingString:PREFIX_AGO];
          dayString    = [dayString stringByAppendingString:PREFIX_AGO];
          hourString   = [hourString stringByAppendingString:PREFIX_AGO];
          minuteString = [minuteString stringByAppendingString:PREFIX_AGO];
          secondString = [secondString stringByAppendingString:PREFIX_AGO];
        }
        else
        {
          full_weekString   = [full_weekString stringByAppendingString:PREFIX_AGO];
          full_dayString    = [full_dayString stringByAppendingString:PREFIX_AGO];
          full_hourString   = [full_hourString stringByAppendingString:PREFIX_AGO];
          full_minuteString = [full_minuteString stringByAppendingString:PREFIX_AGO];
          full_secondString = [full_secondString stringByAppendingString:PREFIX_AGO];
        }
        break;
      }
    }
  
    if (yearsDiff > 1)
    {
     return (fullStrings)? full_yearString : yearString;
    }
  
    if (monthsDiff > 0)
    {
      return (fullStrings)? full_dateString : dateString;
    }
    else
    {
      if (weeksDiff > 0)
      {
        return (fullStrings)? full_weekString : weekString;
      }
      else
      {
        if (daysDiff > 0 && daysDiff <= 4)
        {
          return [dayFormatter stringFromDate:self];
        }
        else if (daysDiff > 4)
        {
          return (fullStrings)? full_dayString : dayString;
        }
        else
        {
          if (hoursDiff == 0)
          {
            if (minutesDiff == 0)
              return (fullStrings)? full_secondString : secondString;
            else
              return (fullStrings)? full_minuteString : minuteString;
          }
          else
          {
            return (fullStrings)? full_hourString : hourString;
          }
        }
    }
  }
}

@end

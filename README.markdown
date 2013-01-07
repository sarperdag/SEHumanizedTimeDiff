SEHumanizedTimeDiff
====================

SEHumanizedTime with customizable date mode
---------------------

SEHumanizedTime with customizable date mode.

Introduction
---------------------

SEHumanizedTime is a NSDate Category for you to have humanly meaningful time intervals between dates. It is especially useful for use in social apps with 
timelines of events. 

Usage
---------------------

Just add SEHumanizedTime folder into your project and use it as below:

``` objective-c

//1 minute
myLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-360]
                stringWithHumanizedTimeDifference:NSDateHumanizedSuffixNone
                withFullString:NO];
//This will return @"1m"

//2 days
myLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-3600*24*2]
                stringWithHumanizedTimeDifference:NSDateHumanizedSuffixAgo
                withFullString:YES];
//This will return @"2 days ago"
```

Enumerations
---------------------

``` objective-c
NSDateHumanizedSuffixNone
NSDateHumanizedSuffixLeft
NSDateHumanizedSuffixAgo
```

NSDateHumanizedSuffixNone | withFullString:NO
---------------------

<p align="center">
  <img src="https://raw.github.com/kwent/SEHumanizedTimeDiff/master/Screenshots/1.png" alt="NSDateHumanizedSuffixNone | withFullString:NO"/>
</p>

``` plain
Year     : 2010-09-14 | if > 1 year
Months   : 2Apr.      | if > 1 month but in the same year
Weeks    : 3w
Days     : 2d
Hours    : 4h
Minutes  : 9m
Secondes : 3s
```


NSDateHumanizedSuffixNone | withFullString:YES
---------------------

<p align="center">
  <img src="https://raw.github.com/kwent/SEHumanizedTimeDiff/master/Screenshots/2.png" alt="NSDateHumanizedSuffixNone | withFullString:YES"/>
</p>

``` plain
Year     : 2010-09-14   | if > 1 year
Months   : 2 April      | if > 1 month but in the same year
Weeks    : 3 week(s)    | With dynamic pluralize
Days     : 2 day(s)     | With dynamic pluralize
Hours    : 4 hour(s)    | With dynamic pluralize
Minutes  : 9 minute(s)  | With dynamic pluralize
Secondes : 3 seconde(s) | With dynamic pluralize
```

NSDateHumanizedSuffixLeft | withFullString:NO
---------------------

<p align="center">
  <img src="https://raw.github.com/kwent/SEHumanizedTimeDiff/master/Screenshots/3.png" alt="NSDateHumanizedSuffixLeft | withFullString:NO"/>
</p>

``` plain
Year     : Until the 2010-09-14 | if > 1 year
Months   : Until the 2Apr.      | if > 1 month but in the same year
Weeks    : 3w left
Days     : 2d left
Hours    : 4h left
Minutes  : 9m left
Secondes : 3s left
```


NSDateHumanizedSuffixLeft | withFullString:YES
---------------------

<p align="center">
  <img src="https://raw.github.com/kwent/SEHumanizedTimeDiff/master/Screenshots/4.png" alt="NSDateHumanizedSuffixLeft | withFullString:YES"/>
</p>

``` plain
Year     : Until the 2010-09-14 | if > 1 year
Months   : Until the 2April     | if > 1 month but in the same year
Weeks    : 3 week(s) left       | With dynamic pluralize
Days     : 2 day(s) left        | With dynamic pluralize
Hours    : 4 hour(s) left       | With dynamic pluralize
Minutes  : 9 minute(s) left     | With dynamic pluralize
Secondes : 3 seconde(s) left    | With dynamic pluralize
```

NSDateHumanizedSuffixAgo | withFullString:NO
---------------------

<p align="center">
  <img src="https://raw.github.com/kwent/SEHumanizedTimeDiff/master/Screenshots/5.png" alt="NSDateHumanizedSuffixAgo | withFullString:NO"/>
</p>

``` plain
Year     : 2010-09-14 | if > 1 year
Months   : 2Apr.      | if > 1 month but in the same year
Weeks    : 3w ago
Days     : 2d ago
Hours    : 4h ago
Minutes  : 9m ago
Secondes : 3s ago
```

NSDateHumanizedSuffixAgo | withFullString:YES
---------------------

<p align="center">
  <img src="https://raw.github.com/kwent/SEHumanizedTimeDiff/master/Screenshots/6.png" alt="NSDateHumanizedSuffixAgo | withFullString:YES"/>
</p>

``` plain
Year     : 2010-09-14       | if > 1 year
Months   : 2 April          | if > 1 month but in the same year
Weeks    : 3 week(s) ago    | With dynamic pluralize
Days     : 2 day(s) ago     | With dynamic pluralize
Hours    : 4 hour(s) ago    | With dynamic pluralize
Minutes  : 9 minute(s) ago  | With dynamic pluralize
Secondes : 3 seconde(s) ago | With dynamic pluralize
```

To do
---------------------
- French, German, [...], Spanish language support.

Authors
---------------------
- Sarp Erdag <sarp.erdag@apperto.com> - http://www.sarperdag.com
- Quentin Rousseau <contact@quentinrousseau.fr> - http://www.quentinrousseau.fr

License
---------------------

Open Source Initiative OSI - The MIT License (MIT):Licensing [OSI Approved License] The MIT License (MIT)

Copyright (c) 2012 Sarp Erdag <sarp.erdag@apperto.com> & Quentin Rousseau <contact@quentin.rousseau.fr>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

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

myLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-360] stringWithHumanizedTimeDifference:NSDateHumanizedSuffixNone withFullString:NO];

myLabel.text = [[NSDate dateWithTimeIntervalSinceNow:-360] stringWithHumanizedTimeDifference:NSDateHumanizedSuffixAgo withFullString:YES];

```

Enumerations
---------------------

``` objective-c
NSDateHumanizedSuffixNone
NSDateHumanizedSuffixLeft
NSDateHumanizedSuffixAgo
```

NSDateHumanizedSuffixNone && withFullString:NO
---------------------

``` plain
Year : 2010-09-14 | if > 1 year

Months : 2Apr | if > 1 months but in the same year

Weeks : 3w

Days : 2d

Hours : 4h

Minutes : 9m

Secondes : 3s
```

NSDateHumanizedSuffixNone && withFullString:YES
---------------------

``` plain
Year : 2010-09-14 | if > 1 year

Months : 2 April | if > 1 months but in the same year

Weeks : 3 week(s)

Days : 2 day(s)

Hours : 4 hour(s)

Minutes : 9 minute(s)

Secondes : 3 seconde(s)
```

NSDateHumanizedSuffixLeft | && withFullString:NO
---------------------

``` plain
Year : Until 2010-09-14 | if > 1 year

Months : Until 2Apr | if > 1 months but in the same year

Weeks : 3w left | With dynamic pluralize

Days : 2d left | With dynamic pluralize

Hours : 4h left | With dynamic pluralize

Minutes : 9m left | With dynamic pluralize

Secondes : 3s left
```

NSDateHumanizedSuffixLeft | && withFullString:YES
---------------------

``` plain
Year : Until 2010-09-14 | if > 1 year

Months : Until 2April | if > 1 months but in the same year

Weeks : 3 week(s) left | With dynamic pluralize

Days : 2 day(s) left | With dynamic pluralize

Hours : 4 hour(s) left | With dynamic pluralize

Minutes : 9 minute(s) left | With dynamic pluralize

Secondes : 3 seconde(s) left
```

NSDateHumanizedSuffixAgo | && withFullString:NO
---------------------

``` plain
Year : 2010-09-14 | if > 1 year

Months : 2Apr | if > 1 months but in the same year

Weeks : 3w ago | With dynamic pluralize

Days : 2d ago | With dynamic pluralize

Hours : 4h ago | With dynamic pluralize

Minutes : 9m ago | With dynamic pluralize

Secondes : 3s ago
```


NSDateHumanizedSuffixAgo | && withFullString:YES
---------------------

``` plain
Year : 2010-09-14 | if > 1 year

Months : 2 April | if > 1 months but in the same year

Weeks : 3 week(s) ago | With dynamic pluralize

Days : 2 day(s) ago | With dynamic pluralize

Hours : 4 hour(s) ago | With dynamic pluralize

Minutes : 9 minute(s) ago | With dynamic pluralize

Secondes : 3 seconde(s) ago left
```


License
---------------------

Open Source Initiative OSI - The MIT License (MIT):Licensing [OSI Approved License] The MIT License (MIT)

Copyright (c) 2011 Sarp Erdag

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

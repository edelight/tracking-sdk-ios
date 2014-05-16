## ShopLove iOS Tracking SDK
================

### 1. Installation
There are only a few steps to integrate the ShopLove Tracking Service into your project.

#### CocoaPods
If you're using [CocoaPods][cocoapods], you can add the following line to your
`Podfile`

```ruby
pod ‘ShopLoveTracking’, :git => 'git://github.com/ShopLove/tracking-sdk-ios.git', :tag => 'v1.0.0’
```

#### Drag & Drop
Assuming that you’re developing with Xcode, simply download the latest release from the [releases page][releases] and add the SLTTracking directory to your project.




### 2. Integrate ShopLoveTracking into your app

Navigate to your Application Delegate source file and add 

```objc
#import "SLTTracking.h"
```

at the top of you file. In the -application:didFinishLaunchingWithOptions: or -applicationDidFinishLaunching: method add the following calls to SLTTracking.


```objc
[SLTTracking setLogLevel:SLTLogLevelVerbose];
[SLTTracking appDidLaunch:@"{YourAppToken}"];
```

Replace `{YourAppToken}` with your App Token.


[cocoapods]: http://cocoapods.org
[releases]: https://github.com/ShopLove/tracking-sdk-ios/releases




## License

The ShopLove Tracking SDK is licensed under the MIT License.

Copyright (c) 2014 
The Visual Shopping Company GmbH (ShopLove)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
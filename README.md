a subclass of SenTestCase which is compatible with asynchronous tests.

## Usage

insert `self.finished = YES;` when test is finished.

```objectivec
- (void)testExample
{
    NSURL *URL = [NSURL URLWithString:@"http://www.apple.com"];
    NSURLRequest *reqeust = [NSURLRequest requestWithURL:URL];
    [NSURLConnection sendAsynchronousRequest:reqeust
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
                               STAssertEquals(statusCode, 200, nil);
                               STAssertNil(error, nil);

                               self.finished = YES;
                           }];
}
```

### Customizing timeout interval

insert `self.timeoutInterval = 30.0;` in `setUp` or test case.

## Installing

Add files under `SenAsyncTestCase/` to your Xcode project.

### CocoaPods

If you use CocoaPods, you can install SenAsyncTestCase by inserting config below.
```
target :YourTestTargetName do
    pod 'SenAsyncTestCase', :git => 'https://github.com/ishkawa/SenAsyncTestCase.git'
end
```

## License

Copyright (c) 2013 Yosuke Ishikawa

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


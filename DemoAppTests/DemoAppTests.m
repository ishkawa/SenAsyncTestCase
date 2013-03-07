#import "DemoAppTests.h"

@implementation DemoAppTests

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

@end

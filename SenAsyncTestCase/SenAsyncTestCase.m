#import "SenAsyncTestCase.h"

@implementation SenAsyncTestCase

#pragma mark - default settings

static NSTimeInterval __defaultTimeoutInterval = 10.f;

+ (NSTimeInterval)defaultTimeoutInterval
{
    return __defaultTimeoutInterval;
}

+ (void)setDefaultTimeoutInterval:(NSTimeInterval)interval
{
    __defaultTimeoutInterval = interval;
}

#pragma mark - setUp / tearDown

- (void)setUp
{
    [super setUp];
    
    self.timeoutInterval = __defaultTimeoutInterval;
    self.finished = NO;
}

- (void)tearDown
{
    double delayInSeconds = self.timeoutInterval;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        STFail(@"timed out.");
        self.finished = YES;
    });
    
    do {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:.1]];
    } while (!self.isFinished);
    
    [super tearDown];
}

@end

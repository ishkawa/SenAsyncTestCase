#import <SenTestingKit/SenTestingKit.h>
#import <SenAsyncTestCase/SenTestCase+Wait.h>

@interface SenAsyncTestCase : SenTestCase

@property (nonatomic) NSTimeInterval timeoutInterval;
@property (nonatomic, getter = isFinished) BOOL finished;

@end

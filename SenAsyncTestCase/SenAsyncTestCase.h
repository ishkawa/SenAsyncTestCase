#import <SenTestingKit/SenTestingKit.h>

@interface SenAsyncTestCase : SenTestCase

@property (nonatomic) NSTimeInterval timeoutInterval;
@property (nonatomic, getter = isFinished) BOOL finished;

@end

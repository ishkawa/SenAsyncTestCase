#import <SenTestingKit/SenTestingKit.h>

@interface SenTestCase (Wait)

@property (nonatomic, getter = isWaiting) BOOL waiting;

- (void)wait;
- (void)finish;

@end

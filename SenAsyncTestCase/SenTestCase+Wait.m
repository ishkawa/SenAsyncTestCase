#import "SenTestCase+Wait.h"
#import <objc/runtime.h>

static char *const SenWaitingKey = "SenWaitingKey";

@implementation SenTestCase (Wait)

- (BOOL)isWaiting
{
    return [objc_getAssociatedObject(self, SenWaitingKey) boolValue];
}

- (void)setWaiting:(BOOL)waiting
{
    objc_setAssociatedObject(self, SenWaitingKey, @(waiting), OBJC_ASSOCIATION_RETAIN);
}

#pragma mark -

- (void)wait
{
    do {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:.1]];
    } while (self.isWaiting);
}

- (void)finish
{
    self.waiting = NO;
}

@end

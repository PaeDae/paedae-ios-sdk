//
//  PaeDaePrizeDelegate.m
//  skymonkey
//
//  Created by Miguel Morales on 7/19/12.
//  Copyright (c) 2012 PaeDae Inc. All rights reserved.

#import "PaeDaeSharedPrizeDelegate.h"

@implementation PaeDaeSharedPrizeDelegate

static PaeDaeSharedPrizeDelegate *sharedDelegate = nil;

#pragma mark - static singleton access method
+ (id) sharedDelegate
{
    if (self == [PaeDaeSharedPrizeDelegate class] && !sharedDelegate)
    {
        sharedDelegate = [[PaeDaeSharedPrizeDelegate alloc] init];
    }
    
    return sharedDelegate;
}

#pragma mark - PaeDae Prize Callbacks
- (void) PaeDae_PrizeWillDisplay:(UIView *)view
{
    NSLog(@"%s - called", __FUNCTION__);
    
    if (!view) return;
    view.transform = CGAffineTransformConcat(CGAffineTransformIdentity, CGAffineTransformMakeScale(.001, .001));
    
    [UIView animateWithDuration:0.75f animations:^{
        view.transform = CGAffineTransformMakeScale(1,1);
    }];
}

- (BOOL) PaeDae_PrizeWillUnload:(UIView *)view
{
    NSLog(@"%s - called", __FUNCTION__);
    
    [UIView animateWithDuration:0.75f animations:^{
        view.alpha = 0.0;
    }];
    
    return NO;
}

- (void)PaeDae_PrizeUnloaded {
	NSLog(@"prize unloaded");
}

@end

//
//  PaeDaePrizeDelegate.h
//  skymonkey
//
//  Created by Miguel Morales on 7/19/12.
//  Copyright (c) 2012 PaeDae Inc. All rights reserved.

#import <Foundation/Foundation.h>
#import "PaeDaePrizeSDK.h"

@interface PaeDaeSharedPrizeDelegate : NSObject<PaeDaePrizeDelegate>
+ (PaeDaeSharedPrizeDelegate *) sharedDelegate;

- (void) PaeDae_PrizeWillDisplay: (UIView *)view;
- (BOOL) PaeDae_PrizeWillUnload: (UIView *)view;
- (void) PaeDae_PrizeUnloaded;

@end

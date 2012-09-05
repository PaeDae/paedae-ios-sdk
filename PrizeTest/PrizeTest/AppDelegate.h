//
//  AppDelegate.h
//  PrizeTest
//
//  Created by Bardwick David on 7/19/12.
//  Copyright (c) 2012 PaeDae Inc. All rights reserved.

#import <UIKit/UIKit.h>
#import "PaeDaePrizeSDK.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, PaeDaeInitDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end

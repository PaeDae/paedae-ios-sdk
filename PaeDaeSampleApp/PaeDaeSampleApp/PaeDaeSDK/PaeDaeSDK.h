//
//  PaeDaeSDK.h
//  PaeDaeSDK
//
//  Created by PaeDae on 8/13/12.
//  Copyright (c) 2012 PaeDae. All rights reserved.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define PAEDAE_SDK_VERSION @"1.2.0"

#pragma mark - init delegate
@protocol PaeDaeInitDelegate <NSObject>
@optional
- (void) PaeDae_Initialized;
- (void) PaeDae_InitializeFailed;
- (void) PaeDae_Finished;
@end

#pragma mark - ad display delegate
@protocol PaeDaeAdDelegate <NSObject>
@optional
- (void) PaeDae_AdActionTaken;
- (void) PaeDae_AdUnavailable;
- (void) PaeDae_AdWillDisplay:(UIView *)view;
- (BOOL) PaeDae_AdWillUnload:(UIView *)view;
- (void) PaeDae_AdUnloaded;
@end

@interface PaeDaeSDK : NSObject
#pragma mark - shared manager
+(PaeDaeSDK *) sharedManager;

#pragma mark - start session API definitions
- (void) initWithKey:(NSString*)key;
- (void) initWithKey:(NSString*)key andDelegate:(id <PaeDaeInitDelegate>)delegate;

#pragma mark - show ad API definitions
- (void) showAd;
- (void) showAdWithOptions:(NSDictionary*)options;
- (void) showAdWithDelegate:(id <PaeDaeAdDelegate>)delegate;
- (void) showAdWithOptions:(NSDictionary*)options andDelegate:(id <PaeDaeAdDelegate>)delegate;

#pragma mark - support properties
@property (nonatomic, retain) UIView *anchorView;

#pragma mark - unsupported API calls (do not use)
@property (nonatomic, assign) BOOL bootstrapped;
@property (nonatomic, assign) BOOL enabled;
@property (nonatomic, assign) BOOL apiAvailable;
@property (nonatomic, retain) id <PaeDaeInitDelegate> initDelegate;
@property (nonatomic, retain) id <PaeDaeAdDelegate> adDelegate;
@property (nonatomic, retain) UIViewController *controller;

- (void) reloadWebCache;
- (void) clearHistory;

extern BOOL PDDEBUG;

@end


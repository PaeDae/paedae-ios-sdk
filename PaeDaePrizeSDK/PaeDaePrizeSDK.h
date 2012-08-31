//
//  PaeDaePrizeSDK.h
//  PaeDaePrizeSDK
//
//  Created by PaeDae on 8/13/12.
//  Copyright (c) 2012 PaeDae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - init delegate
@protocol PaeDaeInitDelegate <NSObject>
@optional
- (void) PaeDae_Initialized;
- (void) PaeDae_InitializeFailed;
@end

#pragma mark - prize display delegate
@protocol PaeDaePrizeDelegate <NSObject>
@optional
- (void) PaeDae_PrizeWillDisplay:(UIView *)view;
- (BOOL) PaeDae_PrizeWillUnload:(UIView *)view;
- (void) PaeDae_PrizeUnloaded;
@end

@interface PaeDaePrizeSDK : NSObject
#pragma mark - shared manager
+(PaeDaePrizeSDK *) sharedManager;

#pragma mark - bootstrap API definitions
- (void) initWithKey:(NSString*)key;
- (void) initWithKey:(NSString*)key andPlayerInfo:(NSDictionary*)playerInfo;
- (void) initWithKey:(NSString*)key andDelegate:(id <PaeDaeInitDelegate>)delegate;
- (void) initWithKey:(NSString*)key andDelegate:(id <PaeDaeInitDelegate>)delegate andPlayerInfo:(NSDictionary*)playerInfo;

#pragma mark - update player info API definitions
- (void) updatePlayerInfo:(NSDictionary*)playerInfo;

#pragma mark - show prize API definitions
- (void) showPrize;
- (void) showPrizeWithOptions:(NSDictionary*)prizeDictionary;
- (void) showPrizeWithDelegate:(id <PaeDaePrizeDelegate>)delegate;
- (void) showPrizeWithOptions:(NSDictionary*)prizeDictionary andDelegate:(id <PaeDaePrizeDelegate>)delegate;

- (void) setOrientation:(UIInterfaceOrientation) orientation;

#pragma mark - unsupported API calls (do not use)
@property (nonatomic, assign) BOOL bootstrapped;
@property (nonatomic, assign) BOOL enabled;
@property (nonatomic, retain) id <PaeDaeInitDelegate>initDelegate;
@property (nonatomic, retain) id <PaeDaePrizeDelegate>prizeDelegate;
@property (nonatomic, retain) UIViewController *controller;

- (void) reloadWebCache;
- (void) clearHistory;
@end


//
//  PaeDaePrizeSDK.h
//  PaeDaePrizeSDK
//
//

#import <UIKit/UIKit.h>


@protocol PaeDaeNetworkAccessDelegate;

@interface PaeDaeNetworkAccess : NSObject

- (bool)sendHTTPRequest:(NSDictionary *)parms;

@property (nonatomic, assign) id <PaeDaeNetworkAccessDelegate> networkClientDelegate;

@end

@protocol PaeDaeNetworkAccessDelegate <NSObject>

- (void) PaeDaeInitSucceeded;
- (void) PaeDaeInitFailed;
- (void) PaeDaePrizeOffer:(NSString*)prizeSize:(NSString*)prizePlacement:(NSString*)prizeId;
- (void) PaeDaeNoPrizeOffer;
@optional
- (void) PaeDaeConnectionDidFailWithError:(NSError *)error:(NSDictionary*)requestDict;

@end



@protocol PaeDaeInitDelegate;
@protocol PaeDaePrizeDelegate;

@interface PaeDaePrizeSDK : UIView <UIWebViewDelegate, PaeDaeNetworkAccessDelegate, UIGestureRecognizerDelegate>

- (PaeDaePrizeSDK*) initWithKey:(NSString*)key;
- (PaeDaePrizeSDK*) initWithKey:(NSString*)key andPlayerInfo:(NSDictionary*)playerInfo;
- (PaeDaePrizeSDK*) initWithKey:(NSString*)key andDelegate:(id <PaeDaeInitDelegate>)delegate;
- (PaeDaePrizeSDK*) initWithKey:(NSString*)key andDelegate:(id <PaeDaeInitDelegate>)delegate andPlayerInfo:(NSDictionary*)playerInfo;

- (void) updatePlayerInfo:(NSDictionary*)playerInfo;

- (void) showPrize;
- (void) showPrizeWithOptions:(NSDictionary*)prizeDictionary;
- (void) showPrizeWithDelegate:(id <PaeDaePrizeDelegate>)delegate;
- (void) showPrizeWithOptions:(NSDictionary*)prizeDictionary andDelegate:(id <PaeDaePrizeDelegate>)delegate;

+(PaeDaePrizeSDK *)sharedManager;


@property (nonatomic, assign) id <PaeDaeInitDelegate> initDelegate;
@property (nonatomic, assign) id <PaeDaePrizeDelegate> prizeDelegate;
@end

@protocol PaeDaeInitDelegate <NSObject>
@optional
- (void) PaeDae_Initialized;
- (void) PaeDae_InitializeFailed;
@end

@protocol PaeDaePrizeDelegate <NSObject>
@optional
- (void) PaeDae_prizeWillDisplay:(bool)isLarge;
- (void) PaeDae_prizeUnloaded;
@end



//
//  ViewController.h
//  PrizeTest
//
//

#import <UIKit/UIKit.h>
#import "PaeDaePrizeSDK.h"

@interface ViewController : UIViewController <PaeDaePrizeDelegate>
{
//	@private
//	PaeDaePrizeSDK *paedaePrizeClient;
}

//@property (nonatomic, retain) PaeDaePrizeSDK *paedaePrizeClient;

- (IBAction)showSmallPrizeTopTapped:(id)sender;
- (IBAction)showSmallPrizeBottomTapped:(id)sender;
- (IBAction)showLargePrizeTapped:(id)sender;
- (IBAction)updateInformationTapped:(id)sender;

@end

//
//  ViewController.h
//  PrizeTest
//
//

#import <UIKit/UIKit.h>
#import "PaeDaePrizeSDK.h"

@interface ViewController : UIViewController <PaeDaePrizeDelegate, UITextFieldDelegate>
{
    NSString *achievementId;
    UILabel *statusLabel;
}

- (IBAction) showSmallPrizeTopTapped:(id)sender;
- (IBAction) showSmallPrizeBottomTapped:(id)sender;
- (IBAction) showLargePrizeTapped:(id)sender;
- (IBAction) level1Pressed:(id)sender;
- (IBAction) level2Pressed:(id)sender;
- (IBAction) level3Pressed:(id)sender;
- (IBAction) updateInformationTapped:(id)sender;

@property (nonatomic, retain) NSString *achievementId;
@property (nonatomic, retain) IBOutlet UILabel *statusLabel;
  
@end

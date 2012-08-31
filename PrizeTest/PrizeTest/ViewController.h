//
//  ViewController.h
//  PrizeTest
//
//

#import <UIKit/UIKit.h>
#import "PaeDaePrizeSDK.h"

@interface ViewController : UIViewController <PaeDaePrizeDelegate, UITextFieldDelegate>
{
    UILabel *statusLabel;
    IBOutlet UITextField *achievementTextView;
}

- (IBAction) showSmallPrizeTopTapped:(id)sender;
- (IBAction) showSmallPrizeBottomTapped:(id)sender;
- (IBAction) showLargePrizeTapped:(id)sender;
- (IBAction) level1Pressed:(id)sender;
- (IBAction) level2Pressed:(id)sender;
- (IBAction) level3Pressed:(id)sender;
- (IBAction) updateInformationTapped:(id)sender;
- (IBAction) delayedPrizePressed:(id)sender;
- (IBAction) showDummyController:(id)sender;
- (IBAction) showLandscapeController:(id)sender;

@property (nonatomic, retain) IBOutlet UILabel *statusLabel;
@property (nonatomic, retain) IBOutlet UITextField *achievementTextView;  

@end

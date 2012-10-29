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

- (IBAction) showPrizePressed:(id)sender;
- (IBAction) level1Pressed:(id)sender;
- (IBAction) level2Pressed:(id)sender;
- (IBAction) level3Pressed:(id)sender;
- (IBAction) updateInformationPressed:(id)sender;

@property (nonatomic, retain) IBOutlet UILabel *statusLabel;
@property (nonatomic, retain) IBOutlet UITextField *achievementTextView;  

@end

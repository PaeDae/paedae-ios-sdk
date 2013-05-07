//
//  ViewController.h
//  PrizeTest
//
//

#import <UIKit/UIKit.h>
#import "PaeDaeSDK.h"

@interface ViewController : UIViewController <PaeDaeAdDelegate, UITextFieldDelegate>
{
    UILabel *statusLabel;
    IBOutlet UITextField *achievementTextView;
}

- (IBAction) showAdPressed:(id)sender;
- (IBAction) showBartrPressed:(id)sender;
- (IBAction) showRewardPressed:(id)sender;
- (IBAction) updateInformationPressed:(id)sender;

@property (nonatomic, retain) IBOutlet UILabel *statusLabel;
@property (nonatomic, retain) IBOutlet UITextField *achievementTextView;  

@end

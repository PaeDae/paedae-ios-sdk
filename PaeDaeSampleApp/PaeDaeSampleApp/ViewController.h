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
    IBOutlet UITextField *zoneSlugTextView;
}

- (IBAction) showAdPressed:(id)sender;
@property (nonatomic, retain) IBOutlet UILabel *statusLabel;
@property (nonatomic, retain) IBOutlet UITextField *zoneSlugTextView;

@end

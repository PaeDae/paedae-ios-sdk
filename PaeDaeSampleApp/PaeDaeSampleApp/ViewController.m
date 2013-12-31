//
//  ViewController.m
//  PrizeTest
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize statusLabel;
@synthesize zoneSlugTextView;

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"%s - called", __FUNCTION__);
}

- (void)viewDidLoad
{
    NSLog(@"%s - called", __FUNCTION__);
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    NSLog(@"About to rotate screen");
	
    return YES;
}
 
- (IBAction)showAdPressed:(id)sender	{
    NSLog(@"%s - called", __FUNCTION__);
    
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:zoneSlugTextView.text, @"zone_slug", nil];
    [[PaeDaeSDK sharedManager] showAdWithOptions:options andDelegate:self];
}

#pragma mark - hide keyboard when finished editing the text field
- (IBAction) onZoneSlugEdited:(UITextField *)textField
{
    [textField resignFirstResponder];
}

#pragma mark - uitextfield delegate
-(BOOL) textFieldShouldReturn:(UITextField*) textField {
    NSLog(@"%s - called", __FUNCTION__);
    [textField resignFirstResponder]; 
    return YES;
}

#pragma mark - paedae ad delegate
- (void) PaeDae_AdWillDisplay:(UIView *)view {
    NSLog(@"%s - ad will display", __FUNCTION__);
}

- (void)PaeDae_AdUnloaded {
	NSLog(@"%s - ad unloaded", __FUNCTION__);
}

- (void)PaeDae_AdUnavailable {
	NSLog(@"%s - ad unavailable", __FUNCTION__);
}
@end

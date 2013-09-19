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
@synthesize achievementTextView;

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
    
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:achievementTextView.text, @"milestone_unique_id", nil];
    [[PaeDaeSDK sharedManager] showAdWithOptions:options andDelegate:self];
}

#pragma mark - update player information example
- (IBAction)updateInformationPressed:(id)sender	{
    
	NSDictionary *playerDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                      @"junk@junk.com", @"email",
                                      @"My Name", @"name",
                                      @"2/25/1901", @"birthdate",
                                      @"male", @"gender",
                                      @"90019", @"zipcode",
                                      @"123.567", @"latitude",
                                      @"-144.1234", @"longitude",
                                      nil];
	[[PaeDaeSDK sharedManager] updatePlayerInfo:playerDictionary];
}

#pragma mark - hide keyboard when finished editing the achievement id
- (IBAction) onAchievementIdEdited:(UITextField *)textField 
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

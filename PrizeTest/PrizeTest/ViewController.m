//
//  ViewController.m
//  PrizeTest
//
//

#import "ViewController.h"
#import "DummyViewController.h"
#import "FixedOrientationViewController.h"

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
	
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}
    
- (IBAction)showSmallPrizeTopTapped:(id)sender	{
	NSLog(@"%s - called", __FUNCTION__);
	NSDictionary *prizeDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
									 achievementTextView.text, @"achievement_id",
									 @"small", @"size",
									 @"top", @"placement",
									 nil];
    
    NSLog(@"%s - prize dictionary: %@", __FUNCTION__, prizeDictionary);
	[[PaeDaePrizeSDK sharedManager] showPrizeWithOptions:prizeDictionary andDelegate:self];
}

- (IBAction)showSmallPrizeBottomTapped:(id)sender	{
    NSLog(@"%s - called", __FUNCTION__);
	NSDictionary *prizeDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
									 achievementTextView.text, @"achievement_id",
									 @"small", @"size",
									 @"bottom", @"placement",
									 nil];
    NSLog(@"%s - prize dictionary: %@", __FUNCTION__, prizeDictionary);
	[[PaeDaePrizeSDK sharedManager] showPrizeWithOptions:prizeDictionary andDelegate:self];
}

- (IBAction)showLargePrizeTapped:(id)sender	{
    NSLog(@"%s - called", __FUNCTION__);
    
    NSDictionary *prizeDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
									 achievementTextView.text, @"achievement_id",
									 nil];
    
    [[PaeDaePrizeSDK sharedManager] showPrizeWithOptions:prizeDictionary andDelegate:self];
}

- (IBAction)level1Pressed:(id)sender	{
    NSLog(@"%s - called", __FUNCTION__);
    NSDictionary *prizeDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
									 @"com.skymonkey.1000.earned", @"achievement_id",
									 nil];
    NSLog(@"%s - prize dictionary: %@", __FUNCTION__, prizeDictionary);
	[[PaeDaePrizeSDK sharedManager] showPrizeWithOptions:prizeDictionary andDelegate:self];
}

- (IBAction)level2Pressed:(id)sender	{
    NSLog(@"%s - called", __FUNCTION__);
    NSDictionary *prizeDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
									 @"com.skymonkey.20000.earned", @"achievement_id",
									 nil];
    NSLog(@"%s - prize dictionary: %@", __FUNCTION__, prizeDictionary);
	[[PaeDaePrizeSDK sharedManager] showPrizeWithOptions:prizeDictionary andDelegate:self];
}

- (IBAction)level3Pressed:(id)sender	{
    NSLog(@"%s - called", __FUNCTION__);
    NSDictionary *prizeDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
									 @"com.skymonkey.1000000.earned", @"achievement_id",
									 nil];
    NSLog(@"%s - prize dictionary: %@", __FUNCTION__, prizeDictionary);
	[[PaeDaePrizeSDK sharedManager] showPrizeWithOptions:prizeDictionary andDelegate:self];
}

#pragma mark - show delayed prize example
- (IBAction) delayedPrizePressed:(id)sender {
    NSLog(@"%s - called", __FUNCTION__);
    NSDictionary *prizeDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
									 @"5", @"delay",
									 nil];
    
    NSLog(@"%s - prize dictionary: %@", __FUNCTION__, prizeDictionary);
	
    [[PaeDaePrizeSDK sharedManager] showPrizeWithOptions:prizeDictionary andDelegate:self];        
}

#pragma mark - update player information example
- (IBAction)updateInformationTapped:(id)sender	{
    
	NSDictionary *playerDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                      @"junk@junk.com", @"email",
                                      @"My Name", @"name",
                                      @"2/25/1901", @"birthdate",
                                      @"male", @"gender",
                                      @"90019", @"zipcode",
                                      @"123.567", @"latitude",
                                      @"-144.1234", @"longitude",
                                      nil];
	[[PaeDaePrizeSDK sharedManager] updatePlayerInfo:playerDictionary];
}

# pragma mark - show the dummy controller for more examples
- (IBAction)showDummyController:(id)sender
{
    UIViewController *controller = [[DummyViewController alloc] initWithNibName:@"DummyViewController" bundle:nil];
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;

    [self presentModalViewController:controller animated:YES];
    
    [controller release];
}

#pragma mark -
- (IBAction) showLandscapeController:(id)sender {
    UIViewController *controller = [[FixedOrientationViewController alloc] initWithNibName:@"FixedOrientationViewController" bundle:nil];
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentModalViewController:controller animated:YES];
    
    [controller release];
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

#pragma mark - paedae prize delegate
- (void) PaeDae_PrizeWillDisplay:(UIView *)view {
    NSLog(@"%s - prize will display", __FUNCTION__);
}

- (void)PaeDae_PrizeUnloaded {
	NSLog(@"%s - prize unloaded", __FUNCTION__);
}


@end

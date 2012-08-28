//
//  ViewController.m
//  PrizeTest
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize achievementId;
@synthesize statusLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    achievementId = @"com.paedae.default";
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
    
- (IBAction)showSmallPrizeTopTapped:(id)sender	{
	NSLog(@"%s - called", __FUNCTION__);
	NSDictionary *prizeDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
									 achievementId, @"achievement_id",
									 @"small", @"size",
									 @"top", @"placement",
									 nil];
    
    NSLog(@"%s - prize dictionary: %@", __FUNCTION__, prizeDictionary);
	[[PaeDaePrizeSDK sharedManager] showPrizeWithOptions:prizeDictionary andDelegate:self];
}

- (IBAction)showSmallPrizeBottomTapped:(id)sender	{
    NSLog(@"%s - called", __FUNCTION__);
	NSDictionary *prizeDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
									 achievementId, @"achievement_id",
									 @"small", @"size",
									 @"bottom", @"placement",
									 nil];
    NSLog(@"%s - prize dictionary: %@", __FUNCTION__, prizeDictionary);
	[[PaeDaePrizeSDK sharedManager] showPrizeWithOptions:prizeDictionary andDelegate:self];
}

- (IBAction)showLargePrizeTapped:(id)sender	{
    NSLog(@"%s - called", __FUNCTION__);
    NSDictionary *prizeDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
									 achievementId, @"achievement_id",
									 nil];
    NSLog(@"%s - prize dictionary: %@", __FUNCTION__, prizeDictionary);
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

- (IBAction) onAchievementIdEdited:(UITextField *)textField 
{
    achievementId = textField.text;
    [textField resignFirstResponder];
}

#pragma mark - uitextfield delegate
-(BOOL) textFieldShouldReturn:(UITextField*) textField {
    NSLog(@"%s - called", __FUNCTION__);
    [textField resignFirstResponder]; 
    return YES;
}

#pragma mark - paedae prize delegate
- (void)PaeDae_PrizeWillDisplay:(bool)isLarge	{
	if ( isLarge )
		NSLog(@"about to push the full screen");
	else
		NSLog(@"about to present small prize");
	
}

- (void)PaeDae_PrizeUnloaded	{
	NSLog(@"prize unloaded");
}


@end

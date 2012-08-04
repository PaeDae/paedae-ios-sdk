//
//  ViewController.m
//  PrizeTest
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
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
    
- (IBAction)showSmallPrizeTopTapped:(id)sender	{
	
	NSDictionary *prizeDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
									 @"com.my.achievement", @"achievement_id",
									 @"small", @"size",
									 @"top", @"placement",
									 nil];
	[[PaeDaePrizeSDK sharedManager] showPrizeWithOptions:prizeDictionary andDelegate:self];
}

- (IBAction)showSmallPrizeBottomTapped:(id)sender	{
	NSDictionary *prizeDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
									 @"com.my.achievement", @"achievement_id",
									 @"small", @"size",
									 @"bottom", @"placement",
									 nil];
	[[PaeDaePrizeSDK sharedManager] showPrizeWithOptions:prizeDictionary andDelegate:self];
}

- (IBAction)showLargePrizeTapped:(id)sender	{
	NSDictionary *prizeDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
//									 @"com.my.achievement", @"achievement_id",
									 @"large", @"size",
									 nil];
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

- (void)PaeDae_prizeWillDisplay:(bool)isLarge	{
	if ( isLarge )
		NSLog(@"about to push the full screen");
	else
		NSLog(@"about to present small prize");
	
}

- (void)PaeDae_prizeUnloaded	{
	NSLog(@"prize unloaded");
}


@end

//
//  FixedOrientationViewController.m
//  PrizeTest
//
//  Created by Miguel Morales on 7/19/12.
//  Copyright (c) 2012 PaeDae Inc. All rights reserved.

#import "FixedOrientationViewController.h"
#import "PaeDaeSharedPrizeDelegate.h"

@implementation FixedOrientationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

#pragma mark -
- (IBAction) showLarge:(id)sender {
    [[PaeDaePrizeSDK sharedManager] showPrizeWithDelegate:[PaeDaeSharedPrizeDelegate sharedDelegate]];
}

- (IBAction) showSmall:(id)sender {
    NSLog(@"%s - called", __FUNCTION__);
	NSDictionary *prizeDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
									 @"small", @"size",
									 @"bottom", @"placement",
									 nil];
    NSLog(@"%s - prize dictionary: %@", __FUNCTION__, prizeDictionary);
	[[PaeDaePrizeSDK sharedManager] showPrizeWithOptions:prizeDictionary andDelegate:[PaeDaeSharedPrizeDelegate sharedDelegate]];
}

#pragma mark -
- (IBAction) closeView:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

@end

//
//  DummyViewController.m
//  PrizeTest
//
//  Created by Miguel Morales on 7/19/12.
//  Copyright (c) 2012 PaeDae Inc. All rights reserved.

#import "DummyViewController.h"
#import "PaeDaePrizeSDK.h"

@implementation DummyViewController

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

#pragma mark -
- (IBAction) closeView:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - 
- (IBAction) showLarge:(id)sender {
    NSLog(@"%s - called", __FUNCTION__);
    
    [[PaeDaePrizeSDK sharedManager] showPrizeWithDelegate:self];
}

- (IBAction) showSmall:(id)sender {
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
									 @"small", @"size",
									 @"bottom", @"placement",
									 nil];  
    [[PaeDaePrizeSDK sharedManager] showPrizeWithOptions:options andDelegate:self];
    NSLog(@"%s - called", __FUNCTION__);
}

#pragma mark - View lifecycle
- (void) viewDidAppear:(BOOL)animated
{
	
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [PaeDaePrizeSDK sharedManager].anchorView = self.view;
    [[PaeDaePrizeSDK sharedManager] showPrizeWithDelegate:self];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}
 
#pragma mark - PaeDae Prize Callbacks
- (void) PaeDae_PrizeWillDisplay:(UIView *)view
{
    view.transform = CGAffineTransformConcat(CGAffineTransformIdentity, CGAffineTransformMakeScale(.001, .001));
    
    [UIView animateWithDuration:0.75f animations:^{
        view.transform = CGAffineTransformMakeScale(1,1);
    }];
}

- (BOOL) PaeDae_PrizeWillUnload:(UIView *)view
{
    NSLog(@"%s - called", __FUNCTION__);
    
    [UIView animateWithDuration:0.75f animations:^{
        view.alpha = 0.0;
    }];
    
    return NO;
}

- (void)PaeDae_PrizeUnloaded {
	NSLog(@"prize unloaded");
}

@end

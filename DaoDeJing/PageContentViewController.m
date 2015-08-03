//
//  PageContentViewController.m
//  DaoDeJing
//
//  Created by Christopher on 3/2/15.
//  Copyright (c) 2015 CSR widgets. All rights reserved.
//

#import "PageContentViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface PageContentViewController () <UIPopoverPresentationControllerDelegate>

@property (nonatomic) IBOutlet UITextView *textView;
@property (nonatomic) AVAudioPlayer *player;


@end

@implementation PageContentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self reloadData];
}

- (void)reloadData
{
    NSString *text = [self.delegate textForPageContentViewController:self];
    UIFont *font = [self.delegate fontForPageContentViewController:self];
    self.textView.font = font;
    self.textView.text = text;
}

- (IBAction)onReadingButtonPushed:(UIBarButtonItem *)sender {
    NSLog(@"Reading Pushed");

    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Choose Language"
                                                                         message:@"ABC"
                                                                  preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction *englishAction = [UIAlertAction actionWithTitle:@"English" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.delegate pageContentViewController:self didSetLanguage:@"English"];
    }];
    [actionSheet addAction:englishAction];

    UIAlertAction *simplifiedAction = [UIAlertAction actionWithTitle:@"简体" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"Show simplified");
        //Set Language to Simplified
        [self.delegate pageContentViewController:self didSetLanguage:@"Simplified"];

    }];
    [actionSheet addAction:simplifiedAction];

    UIAlertAction *traditionalAction = [UIAlertAction actionWithTitle:@"繁體" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"Show traditional");
        // Set Language to Traditional
        [self.delegate pageContentViewController:self didSetLanguage:@"Traditional"];
        UIFont *font = [UIFont fontWithName:@"STHeitiSC-Light" size:24];
        [_textView setFont:font];

    }];
    [actionSheet addAction:traditionalAction];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [actionSheet addAction:cancelAction];

    [self presentViewController:actionSheet animated:YES completion:nil];

//    [self performSegueWithIdentifier:@"showPopover" sender:self];


//    // Present the view controller using the popover style.
//    UIPopoverController.modalPresentationStyle = UIModalPresentationPopover;
//    [self presentViewController:UIPopoverController animated: YES completion: nil];

//    // Get the popover presentation controller and configure it.
//    UIPopoverPresentationController *presentationController =
//    [UIPopoverController popoverPresentationController];
//    presentationController.permittedArrowDirections =
//    UIPopoverArrowDirectionLeft | UIPopoverArrowDirectionRight;
//    presentationController.sourceView = UIView;
//    presentationController.sourceRect = sourceRect;
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Assuming you've hooked this all up in a Storyboard with a popover presentation style
//    NSLog(@"Reached prepareForSegue");
//    NSLog(@"The segue identifier is %@", segue.identifier);
//    
//
//    if ([segue.identifier isEqualToString:@"showPopover"]) {
//        UINavigationController *destNav = segue.destinationViewController;
//        PageContentViewController *vc = destNav.viewControllers.firstObject;
//
//        // This is the important part
//        UIPopoverPresentationController *popPC = destNav.popoverPresentationController;
//        popPC.delegate = self;
//    }
//}

- (IBAction)onAudioButtonPushed:(UIBarButtonItem *)sender
{
    NSURL *soundFileURL = [self.delegate soundFileURLForPageContentViewController:self];
    if (soundFileURL) {
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL
                                                             error:nil];

        self.player.numberOfLoops = 0; //Infinite
        [self.player play];
    }
}

- (IBAction)returnToPageContent:(UIStoryboardSegue *)segue {
    NSLog(@"And now we are back.");
}

#pragma - Delegate Methods

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

@end

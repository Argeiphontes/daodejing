//
//  PageContentViewController.m
//  DaoDeJing
//
//  Created by Christopher on 3/2/15.
//  Copyright (c) 2015 CSR widgets. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController () <UIPopoverPresentationControllerDelegate>


@property (strong, nonatomic) IBOutlet UITextView *textView;
@end

@implementation PageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.textView.text = @"Here we are";
    UIFont *font = [UIFont fontWithName:@"STHeitiSC-Light" size:24];

//    UIFont *font = [UIFont fontWithName:@"STHeitiSC-Medium" size:24];
//    UIFont *font = [UIFont fontWithName:@"HiraKakuProN-W6" size:24];


    [_textView setFont:font];
    self.textView.text = self.selectedVerseText;

}
- (IBAction)onReadingButtonPushed:(UIBarButtonItem *)sender {
    NSLog(@"Reading Pushed");

    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Choose Language"
                                                                         message:@"ABC"
                                                                  preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction *englishAction = [UIAlertAction actionWithTitle:@"English" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.delegate pageContentViewController:self didSetLanguage:@"English"];

//        [self.delegate didRequestEnglish];

        //Set Language to English
        

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

- (IBAction)returnToPageContent:(UIStoryboardSegue *)segue {
    NSLog(@"And now we are back.");
}

#pragma - Delegate Methods

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

@end

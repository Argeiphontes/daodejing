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

@end

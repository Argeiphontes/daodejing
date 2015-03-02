//
//  PageContentViewController.m
//  DaoDeJing
//
//  Created by Christopher on 3/2/15.
//  Copyright (c) 2015 CSR widgets. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@property (strong, nonatomic) IBOutlet UITextView *textView;
@end

@implementation PageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.textView.text = @"Here we are";
    self.textView.text = self.selectedVerseText;

}

@end

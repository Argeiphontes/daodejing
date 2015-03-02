//
//  ViewController.m
//  DaoDeJing
//
//  Created by Christopher on 11/28/14.
//  Copyright (c) 2014 CSR widgets. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property NSString *verses;
@property NSArray *simpleVerses;
@property NSArray *traditionalVerses;
@property NSDictionary *englishVerses;
@property NSAttributedString *attributedString;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:@"a clickable word" attributes:@{ @"myCustomTag" : @(YES) }];
////    [paragraph appendAttributedString:attributedString];

    [self initializeVerses];
    UIFont *font = [UIFont fontWithName:@"STHeitiSC-Medium" size:24];
   [_textView setFont:font];
    self.textView.text = self.simpleVerses[7];
}



-(void)initializeVerses
{
    self.verses = @"1\n道可道，非常道\n名可名，非常名\n無名天地之始\n有名萬物之母\n故常無欲\n以觀其妙\n常有欲\n以觀其徼\n此兩者\n同出而異名\n同謂之玄\n玄之又玄\n衆妙之門";
    self.englishVerses = @{@"1":@"1\n\nThe Dao that can be spoken is not the Dao.\n The name that can be named is not a name.\n No name is the beginning of creation. \nThe Name is the mother of all things. \nAbsent desire, you discover wonder; \nwith desire, you encounter the boundaries. \n\nThere are these two: that separate from the name, and that spoken from the darkness. \nDarkness from darkness, the gateway to myriad wonders.", @"2":@"b", @"3":@"c"};


    self.traditionalVerses = [self arrayOfStringsFromPlistWithName:@"DaoDeJing-Traditional"];

    self.simpleVerses = [self arrayOfStringsFromPlistWithName:@"Simplified"];

    return;
}

- (NSArray *)arrayOfStringsFromPlistWithName:(NSString *)plistName
{
    NSString *pathToPlist = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSArray *unprocessedStrings = [NSArray arrayWithContentsOfFile:pathToPlist];
    NSMutableArray *processedStrings = [NSMutableArray array];
    for (NSString *unprocessedString in unprocessedStrings) {
        NSString *processedString = [unprocessedString stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
        [processedStrings addObject:processedString];
    }

    return processedStrings;
}
@end

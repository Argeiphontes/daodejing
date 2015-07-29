//
//  ViewController.m
//  DaoDeJing
//
//  Created by Christopher on 11/28/14.
//  Copyright (c) 2014 CSR widgets. All rights reserved.
//

#import "ViewController.h"
#import "PageContentViewController.h"

@interface ViewController () <PageContentViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property NSString *verses;
@property NSString *selectedLanguage;
@property NSArray *simpleVerses;
@property NSArray *traditionalVerses;
@property NSArray *englishVerses;
@property NSAttributedString *attributedString;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:@"a clickable word" attributes:@{ @"myCustomTag" : @(YES) }];
////    [paragraph appendAttributedString:attributedString];

    [self initializeVerses];
    [self initializePageViewController];
//    self.textView.text = self.simpleVerses[7];
}

-(void)pageContentViewController:(PageContentViewController *)controller
                  didSetLanguage:(NSString *)language
{
    NSLog(@"setting language");

    NSString *text = @"Unknown";
    if ([language isEqualToString:@"English"]) {
        text = self.englishVerses[controller.pageIndex];
    } else if ([language isEqualToString:@"Simplified"]) {
        text = self.simpleVerses[controller.pageIndex];
    } else if ([language isEqualToString:@"Traditional"]) {
        text = self.traditionalVerses [controller.pageIndex];
    }
    controller.textView.text = text;
}

-(void)initializeVerses
{

    self.traditionalVerses = [self arrayOfStringsFromPlistWithName:@"DaoDeJing-Traditional"];

    self.simpleVerses = [self arrayOfStringsFromPlistWithName:@"Simplified"];

    self.englishVerses = [self arrayOfStringsFromPlistWithName:@"EnglishVerses"];

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

#pragma mark - Create the Page View Controller

-(void)initializePageViewController
{
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;

    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    startingViewController.delegate = self;

    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];

    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);

    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;

    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }

    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;

    if (index == NSNotFound) {
        return nil;
    }

    index++;
    if (index == [self.traditionalVerses count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.traditionalVerses count] == 0) || (index >= [self.traditionalVerses count])) {
        return nil;
    }

    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    //    pageContentViewController.imageFile = self.pageImages[index];
// This line needs to be edited to allow for Traditional, Simplified, or English Texts
    pageContentViewController.delegate = self;
    pageContentViewController.selectedVerseText = self.simpleVerses[index];
    pageContentViewController.view.backgroundColor = [UIColor colorWithRed:0.2 green:0.4 blue:0.6 alpha:1];

    pageContentViewController.pageIndex = index;

    return pageContentViewController;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.traditionalVerses count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


@end

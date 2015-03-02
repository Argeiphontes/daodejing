//
//  ViewController.h
//  DaoDeJing
//
//  Created by Christopher on 11/28/14.
//  Copyright (c) 2014 CSR widgets. All rights reserved.
//

#import <UIKit/UIKit.h>


/*
 Steps
 1.  Load text of DaoDeJing 1 - 10
 2.  Create pages using UIPageViewController (cf. PageViewDemo.xcodeapp)  how to show page number?
 3.  Create Library / Table of Contents Using TableView + Index
 4.  Create button for toggling languages E/S/T
 5.  Create Glossary/Commentary for first 3 poems

 Notes



 */

@interface ViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end


//
//  PageContentViewController.h
//  DaoDeJing
//
//  Created by Christopher on 3/2/15.
//  Copyright (c) 2015 CSR widgets. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PageContentViewControllerDelegate;

@interface PageContentViewController : UIViewController

@property (nonatomic, readonly) UITextView *textView;

// qualified as weak to avoid circular reference
@property (weak, nonatomic) id <PageContentViewControllerDelegate> delegate;


@property NSUInteger pageIndex;

- (void)reloadData;

@end


@protocol PageContentViewControllerDelegate <NSObject>

-(void)pageContentViewController:(PageContentViewController *)controller
                  didSetLanguage:(NSString *)language;

-(NSString *)textForPageContentViewController:(PageContentViewController *)controller;

-(UIFont *)fontForPageContentViewController:(PageContentViewController *)controller;

@end

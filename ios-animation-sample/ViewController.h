//
//  ViewController.h
//  ios-animation-sample
//
//  Created by tnaototo on 2014/10/27.
//  Copyright (c) 2014年 tnaototo. All rights reserved.
//

#import <UIKit/UIKit.h>

//@interface rootViewController : UIViewController
//
//@end

@interface ViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *myComment;

@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *myPageControl;

- (IBAction)changedPage:(id)sender;

@end


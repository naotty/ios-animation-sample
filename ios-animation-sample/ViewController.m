//
//  ViewController.m
//  ios-animation-sample
//
//  Created by tnaototo on 2014/10/27.
//  Copyright (c) 2014年 tnaototo. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

#define pageCount   3


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Animation
    CGRect rect = CGRectMake(80, 140, 223, 397);
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:rect];
    imageView.image = [UIImage imageNamed:@"stand1.png"];
    [self.view addSubview:imageView];
    
    NSMutableArray *imageList = [NSMutableArray array];
    for (NSInteger i = 1; i <= 140; i++) {
        NSString *imagePath = [NSString stringWithFormat:@"stand%ld.png", i];
        UIImage *img = [UIImage imageNamed:imagePath];
        [imageList addObject:img];
    }
    
    imageView.animationImages = imageList;
    imageView.animationDuration = 1;
    imageView.animationRepeatCount = 0;
    [imageView startAnimating];
    
    
    // コメント枠を角丸 & コメント表示
    self.myComment.layer.borderColor = [UIColor blackColor].CGColor;
    self.myComment.layer.borderWidth = 1.0;
    self.myComment.layer.cornerRadius = 10.0;
    self.myComment.text = @"こんにちは！ \n今日もいい天気ね。";
    
    
    // ScrollView
    CGFloat scrollWidth = _myScrollView.frame.size.width;
    CGFloat scrollHeight = _myScrollView.frame.size.height;
    
    CGFloat buttonWidth = scrollWidth / 2;
    
    _myScrollView.pagingEnabled = YES;
    _myScrollView.contentSize = CGSizeMake(scrollWidth * pageCount, scrollHeight);
    _myScrollView.showsHorizontalScrollIndicator = NO;
    _myScrollView.showsVerticalScrollIndicator = NO;
    _myScrollView.delegate = self;
    
    for (int i = 0; i < pageCount; i++) {
        
//        // create UILabel
//        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(i * scrollWidth, 0, scrollWidth, scrollHeight)];
//        label.text = [NSString stringWithFormat:@"label is %d", i + 1];
//        label.font = [UIFont fontWithName:@"Arial" size:32];
////        label.backgroundColor = [UIColor blueColor];
//        label.textAlignment = NSTextAlignmentCenter;
//        [_myScrollView addSubview:label];
        
        // create button
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(i * scrollWidth + (buttonWidth/2), 0, buttonWidth, scrollHeight);
        [button setTitle: [NSString stringWithFormat:@"Button%d", i+1] forState:UIControlStateNormal];
        [button setTintColor:[UIColor blackColor]];
        [button setBackgroundColor:[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0]];
        [button.layer setCornerRadius:10.0];
        [button.layer setBorderColor:[UIColor lightGrayColor].CGColor];
        [button.layer setBorderWidth:1.0];
        
        [_myScrollView addSubview:button];
        
        NSLog(@"increment %d", i);
        
    }
    
    _myPageControl.numberOfPages = pageCount;
    _myPageControl.currentPage = 0;
    _myPageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    _myPageControl.pageIndicatorTintColor = [UIColor grayColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = _myScrollView.frame.size.width;
    _myPageControl.currentPage = floor((_myScrollView.contentOffset.x - pageWidth / 2) / pageWidth) +1;
}

- (IBAction)changedPage:(id)sender {
    NSLog(@"current is %ld", _myPageControl.currentPage);
    CGRect frame = _myScrollView.frame;
    frame.origin.x = frame.size.width * _myPageControl.currentPage;
    frame.origin.y = 0;
    [_myScrollView scrollRectToVisible:frame animated:YES];
}

@end

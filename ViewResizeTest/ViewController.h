//
//  ViewController.h
//  ViewResizeTest
//
//  Created by Matt Propst on 8/8/14.
//  Copyright (c) 2014 Matt Propst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *baseView;
@property (weak, nonatomic) IBOutlet UILabel *sampleLabel;
@property (weak, nonatomic) IBOutlet UIButton *resizeLargeBtn;
@property (weak, nonatomic) IBOutlet UIButton *resizeSmallBtn;

@end

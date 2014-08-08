//
//  ViewController.m
//  ViewResizeTest
//
//  Created by Matt Propst on 8/8/14.
//  Copyright (c) 2014 Matt Propst. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(interfaceOrientationDidChangeNotification:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
    
    //Setup base view resize rules:
    self.baseView.autoresizesSubviews = YES;
    self.baseView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)ResizeViewBasedOnButton:(UIButton *)sender {
    if(sender.tag == 1){
        [self.baseView setFrame:CGRectMake(100, 100, 310, 180)];
        [self updateTextFontSize:14 andXPosition:70];
    }else{
        [self.baseView setFrame:CGRectMake(100, 100, 510, 380)];
        [self updateTextFontSize:18 andXPosition:50];
    }
}

- (void)interfaceOrientationDidChangeNotification:(NSNotification*)note
{
    UIInterfaceOrientation currentOrientation = [UIApplication sharedApplication].statusBarOrientation;
    BOOL isLandscape;
    NSLog(@"Original Frame Size: %@", NSStringFromCGRect(self.baseView.frame));

    if((currentOrientation == UIInterfaceOrientationLandscapeLeft)
       || (currentOrientation == UIInterfaceOrientationLandscapeRight)){
        isLandscape = YES;
        [self.baseView setFrame:CGRectMake(100, 100, 310, 180)];
        [self updateTextFontSize:14 andXPosition:70];
        NSLog(@"In Landscape Mode Frame Size: %@", NSStringFromCGRect(self.baseView.frame));
    }else{
        NSLog(@"In portrait mode");
        [self.baseView setFrame:CGRectMake(100, 100, 610, 480)];
        [self updateTextFontSize:18 andXPosition:50];
        NSLog(@"In portrait mode Frame Size: %@", NSStringFromCGRect(self.baseView.frame));
        
    }
    
    [self.view setNeedsLayout];
}

- (void)updateTextFontSize:(int)fontSize
              andXPosition:(int)xPosition{
    CGRect updatedSampleLabelFrame = self.sampleLabel.frame;
    updatedSampleLabelFrame.origin.x = xPosition;
    
    [self.sampleLabel setFont:[UIFont systemFontOfSize:fontSize]];
    [self.sampleLabel setFrame:updatedSampleLabelFrame];
}

@end

//
//  GLWViewController.m
//  GLWKit
//
//  Created by shaodoune on 09/02/2020.
//  Copyright (c) 2020 shaodoune. All rights reserved.
//

#import "GLWViewController.h"
#import <GLWDevice.h>

@interface GLWViewController ()

@end

@implementation GLWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if ([GLWDevice isPad]) {
        NSLog(@"---平板");
    }
    if ([GLWDevice isPhone]) {
        NSLog(@"---手机");
    }
    if ([GLWDevice isDevice]) {
        NSLog(@"---真机");
    }
    else {
        NSLog(@"---模拟器");
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

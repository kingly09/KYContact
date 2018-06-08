//
//  KYViewController.m
//  KYContact
//
//  Created by kingly09 on 06/07/2018.
//  Copyright (c) 2018 kingly09. All rights reserved.
//

#import "KYViewController.h"

@interface KYViewController ()

@end

@implementation KYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)addContact:(id)sender
{
  UIButton * sendButton = (UIButton *)sender;
  
  //button不能再点击
  sendButton.enabled = false;
  
 // [self.contactManager addContact:[RITLContactObject testContactObject]];
  
  //3s后才可再添加,为了能够承接3秒变化通知的响应
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
    [sendButton setEnabled:true];
    
  });
  
}


@end

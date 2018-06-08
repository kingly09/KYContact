//
//  KYViewController.m
//  KYContact
//
//  Created by kingly09 on 06/07/2018.
//  Copyright (c) 2018 kingly09. All rights reserved.
//

#import "KYViewController.h"
#import <KYContact/KYContactsManager.h>
#import <KYContact/KYContactObject.h>
#import <KYContact/NSString+KYContactFile.h>


@interface KYViewController ()

//存放联系人的数组，存放直接请求出的联系人数组
@property (nonatomic, copy)NSArray <KYContactObject *> *  contactObjects;

//存放索引的数组，(e.g. A-Z,# in US/English)
@property (nonatomic, copy)NSArray <NSString *> * titles;

//存放处理过的数组
@property (nonatomic, copy)NSArray <NSArray *> * handleContactObjects;

//负责请求联系人对象
@property (nonatomic, strong) KYContactsManager * contactManager;


@end

@implementation KYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
  //初始化属性
  self.contactManager = [[KYContactsManager alloc]init];
  self.titles = @[];
  
  //开始请求
  [self requestContacts];

}

//开始请求所有的联系人
- (void)requestContacts
{
  __weak typeof(self) copy_self = self;
  
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 90000
  
  //设置便利属性，为了提升速度，只要姓名以及电话属性
  self.contactManager.descriptors = [NSString KYContactNamePhoneKeys];
  
#endif
  
  //通讯发生变化进行的回调
  self.contactManager.contactDidChange = ^(NSArray <KYContactObject *>* contacts){
    
    [copy_self __reloadTableView:contacts];
    
  };
  
  //开始请求
  [self.contactManager requestContactsComplete:^(NSArray<KYContactObject *> * _Nonnull contacts) {
    
    [copy_self __reloadTableView:contacts];
    
  } defendBlock:^{
    
    //maybe you can present an AlerViewController to prompt user some message
    
  }];
}

- (void)__reloadTableView:(NSArray <KYContactObject *> *)contactObjects
{
  //开始赋值
  self.contactObjects = contactObjects;
  
  NSLog(@"self.contactObjects::%@",self.contactObjects);
  
  self.titles = [UILocalizedIndexedCollation currentCollation].sectionTitles;
  
  //刷新
  //[self.tableView reloadData];
}




- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


-(void)dealloc
{
  NSLog(@"%@ dealloc",NSStringFromClass([self class]));
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

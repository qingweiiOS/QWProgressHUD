//
//  QWViewController.m
//  QWProgressHUD
//
//  Created by qingwei2013@foxmail.com on 12/25/2020.
//  Copyright (c) 2020 qingwei2013@foxmail.com. All rights reserved.
//

#import "QWViewController.h"
#import <QWProgressHUD/QWProgressHUD.h>
@interface QWViewController (){
    
    CGFloat progress;
    NSInteger tag;
}
@property (weak, nonatomic) IBOutlet UITextField *timeField;

@end

@implementation QWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    tag = 1;
    self.view.backgroundColor = [UIColor grayColor];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_timeField resignFirstResponder];
}
- (IBAction)action_OK:(id)sender {
    CGFloat showTime = [_timeField.text floatValue];
    [QWProgressHUD setShowTime:showTime];
}
- (IBAction)action_show:(id)sender {
    [QWProgressHUD show];
}
- (IBAction)action_ShowStatus:(id)sender {
    [QWProgressHUD showStatus:@"loading..."];
}
- (IBAction)action_success:(id)sender {
    [QWProgressHUD showSuccess:@"SUCCESS"];
}
- (IBAction)action_successDelay:(id)sender {
    [QWProgressHUD showSuccess:@"SUCCESS" delayDismiss:1.0];
}
- (IBAction)action_showError:(id)sender {
    [QWProgressHUD showError:@"error"];
}
- (IBAction)action_showErrorDelay:(id)sender {
    [QWProgressHUD showError:@"error" delayDismiss:1.0];
}
- (IBAction)action_showMessage:(id)sender {
    [QWProgressHUD showMessage:@"message"];
}
- (IBAction)action_showMessageDelay:(id)sender {
    [QWProgressHUD showMessage:@"message" delayDismiss:2.0];
}
- (IBAction)action_dismiss:(id)sender {
    [QWProgressHUD dismiss];
}
- (IBAction)action_dismssDelay:(id)sender {
    [QWProgressHUD dismissDelay:2.0];
}
- (IBAction)action_showProgress:(id)sender{
    progress+=0.1*tag;
    if(progress>1){
        progress = 1.0;
        tag*=-1;
    }
    if(progress<0){
        progress = 0.0;
        tag*=-1;
    }
    [QWProgressHUD showProgress:progress];
}
- (IBAction)action_showProgressStatus:(id)sender {
    
    progress+=0.1*tag;
    if(progress>1){
        progress = 1.0;
        tag*=-1;
    }
    if(progress<0){
        progress = 0.0;
        tag*=-1;
    }
    [QWProgressHUD showProgress:progress status:[NSString stringWithFormat:@"%.0f%%",progress*100]];
}
- (IBAction)action_changeStyle:(UISegmentedControl *)sender {
    if(sender.selectedSegmentIndex == 0){
        [QWProgressHUD setProgressStyle:QWProgressHUDStyleLight];
    }else{
        [QWProgressHUD setProgressStyle:QWProgressHUDStyleDark];
    }
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

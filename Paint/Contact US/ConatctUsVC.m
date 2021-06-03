//
//  ConatctUsVC.m
//  Paint
//
//  Created by Apple on 4/24/21.
//  Copyright © 2021 Hot Cocoa Software. All rights reserved.
//

#import "ConatctUsVC.h"

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

#import "AFHTTPSessionManager.h"

#import "Paint-Swift.h"
#import "FTIndicator.h"
@import AVFoundation;





@interface ConatctUsVC ()

@end

@implementation ConatctUsVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    
    _lblEmail.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"email"];
    _lblName.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"name"];
    _lblPhone.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"phone"];

//    [[NSUserDefaults standardUserDefaults]setObject:[responseObject objectForKey:@"name"] forKey:@"name"];
//    [[NSUserDefaults standardUserDefaults]setObject:[responseObject objectForKey:@"phone"] forKey:@"phone"];
//    [[NSUserDefaults standardUserDefaults]setObject:[responseObject objectForKey:@"address"] forKey:@"address"];
    
    
    _ViewForm.layer.cornerRadius=15.0;
    _BtnSubmit.layer.cornerRadius=5.0;

    self.navigationController.navigationBarHidden=true;
    _scrollVw.clipsToBounds=YES;
    _scrollVw.contentSize=CGSizeMake(self.view.frame.size.width,754.0+20);
    _scrollVw.showsHorizontalScrollIndicator=false;
    
//    _scrollVw.contentSize=CGSizeMake(self.view.frame.size.width,934.0);

    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    UIColor *colr1 = [UIColor colorWithRed:255.0/255.0 green:225.0/255.0 blue:123.0 / 255.0 alpha:1.0];
    UIColor *colr2 =[UIColor colorWithRed:88.0 / 255.0 green:133.0 / 255.0 blue:59.0 / 255.0 alpha:1.0];
    gradient.colors = [NSArray arrayWithObjects:(id)[colr1 CGColor], (id)[colr2 CGColor], nil];
    [self.view.layer insertSublayer:gradient atIndex:0];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



-(IBAction)SubmitButton:(id)sender
{
    
//    [self GoToMainMenu11];
    
  //  [self CalllingHere];
    
   
//    _feldUser.text=@"waleedashrafusmani@gmail.com";
//    _feldPassword.text=@"123456";

    
//    if([_feldUser.text isEqualToString:@""])
//    {
//
//        [FTIndicator showErrorWithMessage:@"Fill out empty fields"];
//
//     //   [self CalllingHere];
//
//    }
//    else if([_feldPassword.text isEqualToString:@""])
//    {
//
//        [FTIndicator showErrorWithMessage:@"Fill out empty fields"];
//
//        //   [self CalllingHere];
//
//    }
//    else
//    {
        
//        [_feldUser resignFirstResponder];
//        [_feldPassword resignFirstResponder];

           [FTIndicator showProgressWithMessage:@"Logging . . ."];
      //        _feldUser.text=@"admin@admin.com";
      //        _feldPassword.text=@"@Test123";

//              NSString *USerEmail = _feldUser.text;
//              NSString *PasswordNow = _feldPassword.text;

          //    [FTIndicator showProgressWithMessage:@"Logging . . ."];
              
              
      //        NSDictionary *parameters1 = [NSDictionary dictionaryWithObjectsAndKeys:_feldUser.text, @"email", _feldPassword.text, @"Pwd",@"G",@"AccountType",@"ahmad",@"UserName", nil];
      //
              
//              NSDictionary *parameters1 = [NSDictionary dictionaryWithObjectsAndKeys:@"fsr",@"name",@"dcbdhjb@bhbk.ss",@"email",@"123456", @"password",@"123456",@"password_confirmation",@"",@"phone",@"erger",@"address",@"2",@"role_id", nil];
//
//
//        {
//            "name":"sfs","email":"sfvsgj@jgfvgh.hjg","password":"123456","password_confirmation":"123456","phone":"3425","address":"rgtg","role_id":"2"
//        }
        
        NSDictionary *parameters99 =  @{@"name":_lblName.text,@"email":_lblEmail.text,@"phone":_lblPhone.text,@"info":_fieldInfo.text};
        
              
              NSString *strUrl1=@"http://webapi.malerei-linz.com/api/auth/addcontact";
        NSString *encoded = [strUrl1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
              
      //        NSURL *url = [NSURL URLWithString:strUrl1];
              AFHTTPSessionManager *manager2 = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
              manager2.requestSerializer = [AFJSONRequestSerializer serializer];
              [manager2.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      //        [manager2.requestSerializer setValue:@"iCEsNPZOp9y7IzaGvQze" forHTTPHeaderField:@"X-Apikey"];
              
              [manager2 POST:encoded parameters:parameters99 headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
              {
            //   responseObject
              
                  NSLog(@"Yoyo====%@",responseObject);
                  NSString *str44=[responseObject objectForKey:@"message"];

//                 NSDictionary *dic234= [responseObject objectForKey:@"user"];
//                  [[NSUserDefaults standardUserDefaults]setObject:dic234 forKey:@"USer"];
//                  [[NSUserDefaults standardUserDefaults]synchronize];

                  if(str44!=nil)
                  {
                      
                      [FTIndicator showSuccessWithMessage:str44];
//                      [self GoToMainMenu11];
                      [self->_fieldInfo resignFirstResponder];
                  }
                  else
                  {
                      [FTIndicator showErrorWithMessage:@"Wrong Credentials"];
                  }
                  
//                  NSLog(@"Yoyo====%i" ,[[responseObject objectForKey:@"success"]intValue]);
                
                  
              } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                  
                  NSLog(@"FailedFailedFailedFailedFailedFailedFailedFailedFailedFailed");
                  [FTIndicator showErrorWithMessage:@"Wrong Credentials"];

                  
              }];
              
          
          

}



@end

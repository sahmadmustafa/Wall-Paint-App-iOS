//
//  ConatctUsVC.h
//  Paint
//
//  Created by Apple on 4/24/21.
//  Copyright © 2021 Hot Cocoa Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConatctUsVC : UIViewController
@property(nonatomic,strong)IBOutlet UILabel *lblName;
@property(nonatomic,strong)IBOutlet UILabel *lblEmail;
@property(nonatomic,strong)IBOutlet UILabel *lblPhone;
@property(nonatomic,strong)IBOutlet UITextField *fieldInfo;

@property(nonatomic,strong)IBOutlet UIScrollView *scrollVw;

@property(nonatomic,strong)IBOutlet UIView *ViewForm;
@property(nonatomic,strong)IBOutlet UIButton *BtnSubmit;

//    @IBOutlet var feldFirstName: UITextField!

@end


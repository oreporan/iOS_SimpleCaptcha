//
//  SimpleCaptchaViewController.h
//  FormBasedAuthObjC
//
//  Created by Ore Poran on 1/23/16.
//  Copyright © 2016 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IBMMobileFirstPlatformFoundation/IBMMobileFirstPlatformFoundation.h>


@interface SimpleCaptchaViewController : UIViewController
@property SecurityCheckChallengeHandler* challengeHandler;
@property (weak, nonatomic) IBOutlet UITextField *answerTextField;
@property (weak, nonatomic) IBOutlet UILabel *equationLabel;

-(void) displayError;
-(void) displayCaptcha:(NSString *)message;
@end

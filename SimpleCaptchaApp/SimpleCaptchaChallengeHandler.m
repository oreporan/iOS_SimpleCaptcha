//
//  SimpleCaptchaChallengeHandler.m
//  FormBasedAuthObjC
//
//  Created by Ore Poran on 1/23/16.
//  Copyright © 2016 IBM. All rights reserved.
//

#import "SimpleCaptchaChallengeHandler.h"
#import "SimpleCaptchaViewController.h"

@implementation SimpleCaptchaChallengeHandler

-(id)initWithViewController: (ViewController*) vc {
    self = [super initWithSecurityCheck:@"SimpleCaptcha"];
    self.vc = vc;
    return self;
}

/**
 * This method is called when the IBM MobileFirst Platform Server reports an authentication success.
 */
-(void) handleSuccess: (NSDictionary *)success {
    NSLog(@"Challenge success");
    [self.vc.navigationController popViewControllerAnimated:YES];
}

/**
 *  This method is called when the IBM MobileFirst Platform Server reports an authentication failure.
 */
-(void) handleFailure: (NSDictionary *)failure {
    NSLog(@"Challenge failed");
    [self.vc.navigationController popViewControllerAnimated:YES];
}

/**
 * This method is called when the IBM MobileFirst Platform Server returns a challenge for the realm.
 */
-(void) handleChallenge: (NSDictionary *)challenge {
    
    // Extract operands
    NSString *captcha = [challenge objectForKey:@"captcha"];

    
    UIViewController *vc = self.vc.navigationController.visibleViewController;
    BOOL isCaptchaView = [vc isKindOfClass:[SimpleCaptchaViewController class]];
    if(isCaptchaView){
        SimpleCaptchaViewController *captchaViewController = (SimpleCaptchaViewController *)vc;
        [captchaViewController displayError];
        [captchaViewController displayCaptcha:captcha];
        if(!captchaViewController.challengeHandler)
            captchaViewController.challengeHandler = self;
    } else {
        // If the current view is not captchaViewController - we pop it up
        SimpleCaptchaViewController*  captchaViewController = [self.vc.navigationController.storyboard instantiateViewControllerWithIdentifier:@"captchaViewController"];
        captchaViewController.challengeHandler = self;
        [captchaViewController displayCaptcha:captcha];
        [self.vc.navigationController pushViewController:captchaViewController animated:YES];
    }
}


@end

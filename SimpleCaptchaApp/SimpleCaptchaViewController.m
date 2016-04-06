//
//  SimpleCaptchaViewController.m
//  FormBasedAuthObjC
//
//  Created by Ore Poran on 1/23/16.
//  Copyright © 2016 IBM. All rights reserved.
//

#import "SimpleCaptchaViewController.h"

@interface SimpleCaptchaViewController ()

@end

@implementation SimpleCaptchaViewController

NSString *captchaMessage;

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
   [self.equationLabel setText:captchaMessage];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) displayError {
    _answerTextField.backgroundColor = [UIColor colorWithRed:0.93 green:0.31 blue:0.20 alpha:1.0];
}

-(void) displayCaptcha:(NSString *)message {
    captchaMessage = message;
    [self.equationLabel setText:captchaMessage];
}


- (IBAction)submit:(id)sender {
    NSString * textResult = _answerTextField.text;
    NSMutableDictionary * challengeAnswer = [[NSMutableDictionary alloc] init];
    [challengeAnswer setObject:textResult forKey:@"answer"];
    if(self.challengeHandler) {
        [self.challengeHandler submitChallengeAnswer:challengeAnswer];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if(self.isMovingFromParentViewController){
        //User pressed Back button. Cancel authentication
        [self.challengeHandler submitFailure:nil];
    }
}
@end

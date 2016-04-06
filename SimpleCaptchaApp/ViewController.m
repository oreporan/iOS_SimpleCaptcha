/*
 *
 COPYRIGHT LICENSE: This information contains sample code provided in source code form. You may copy, modify, and distribute
 these sample programs in any form without payment to IBM® for the purposes of developing, using, marketing or distributing
 application programs conforming to the application programming interface for the operating platform for which the sample code is written.
 Notwithstanding anything to the contrary, IBM PROVIDES THE SAMPLE SOURCE CODE ON AN "AS IS" BASIS AND IBM DISCLAIMS ALL WARRANTIES,
 EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, ANY IMPLIED WARRANTIES OR CONDITIONS OF MERCHANTABILITY, SATISFACTORY QUALITY,
 FITNESS FOR A PARTICULAR PURPOSE, TITLE, AND ANY WARRANTY OR CONDITION OF NON-INFRINGEMENT. IBM SHALL NOT BE LIABLE FOR ANY DIRECT,
 INDIRECT, INCIDENTAL, SPECIAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR OPERATION OF THE SAMPLE SOURCE CODE.
 IBM HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS OR MODIFICATIONS TO THE SAMPLE SOURCE CODE.
 
 */

#import "ViewController.h"
#import "SimpleCaptchaChallengeHandler.h"
#import <IBMMobileFirstPlatformFoundation/IBMMobileFirstPlatformFoundation.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userScope;
@property (weak, nonatomic) IBOutlet UITextField *userURL;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[WLClient sharedInstance] registerChallengeHandler:[[SimpleCaptchaChallengeHandler alloc] initWithViewController:self]];
    
//    [[WLClient sharedInstance] setHeartBeatInterval:1000.0f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


- (IBAction)obtainToken:(id)sender {
    NSString * scope = @"SimpleCaptcha";
    [[WLAuthorizationManager sharedInstance] obtainAccessTokenForScope:scope withCompletionHandler:^(AccessToken *accessToken, NSError *error) {
        if(error){
            NSLog(@"Obtain auth header failure. Error: %@", error);
            
        }
        else{
            UIAlertView *adapterResponseAlert = [[UIAlertView alloc] initWithTitle:@"Token Received "
                                                                           message:@"Success!"
                                                                          delegate:nil
                                                                 cancelButtonTitle:@"OK"
                                                                 otherButtonTitles:nil];
            [adapterResponseAlert show];
        }
    }];
}


@end

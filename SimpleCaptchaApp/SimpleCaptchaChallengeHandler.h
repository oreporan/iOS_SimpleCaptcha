//
//  SimpleCaptchaChallengeHandler.h
//  FormBasedAuthObjC
//
//  Created by Ore Poran on 1/23/16.
//  Copyright © 2016 IBM. All rights reserved.
//

#import <IBMMobileFirstPlatformFoundation/IBMMobileFirstPlatformFoundation.h>
#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface SimpleCaptchaChallengeHandler : WLChallengeHandler
@property ViewController* vc;

-(id)initWithViewController: (ViewController*) vc;

@end

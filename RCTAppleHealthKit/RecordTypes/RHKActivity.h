//
//  RCTAppleHealthKit+Methods_Activity.h
//  RCTAppleHealthKit
//
//  Created by Alexander Vallorosi on 4/27/17.
//  Copyright © 2017 Alexander Vallorosi. All rights reserved.
//
#import "RCTAppleHealthKit.h"

@interface RCTAppleHealthKit (Activity)

- (void)activity_getActiveEnergyBurned:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback;
- (void)activity_getExerciseMinutes:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback;

@end

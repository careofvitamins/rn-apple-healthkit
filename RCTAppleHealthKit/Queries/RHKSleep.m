//
//  RCTAppleHealthKit+Methods_Sleep.m
//  RCTAppleHealthKit
//
//  Created by Greg Wilson on 2016-11-06.
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "RHKQueries.h"
#import "RHKSleep.h"
#import "RHKUtils.h"

@implementation RCTAppleHealthKit (Sleep)



- (void)sleep_getSleepSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    NSDate *startDate = [RCTAppleHealthKit dateFromOptions:input key:@"startDate" withDefault:nil];
    NSDate *endDate = [RCTAppleHealthKit dateFromOptions:input key:@"endDate" withDefault:[NSDate date]];
    if(startDate == nil){
        callback(@[RCTMakeError(@"startDate is required in options", nil, nil)]);
        return;
    }
    
    NSPredicate *predicate = [RCTAppleHealthKit predicateForSamplesBetweenDates:startDate endDate:endDate];
    NSUInteger limit = [RCTAppleHealthKit uintFromOptions:input key:@"limit" withDefault:HKObjectQueryNoLimit];
    
    
    [self fetchSleepCategorySamplesForPredicate:predicate
                                          limit:limit
                                     completion:^(NSArray *results, NSError *error) {
                                         if(results){
                                             callback(@[[NSNull null], results]);
                                             return;
                                         } else {
                                             NSLog(@"error getting sleep samples: %@", error);
                                             callback(@[RCTMakeError(@"error getting sleep samples", nil, nil)]);
                                             return;
                                         }
                                     }];
    
}


@end

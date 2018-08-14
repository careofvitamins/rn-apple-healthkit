//
//  RCTAppleHealthKit+Methods_Activity.m
//  RCTAppleHealthKit
//
//  Created by Alexander Vallorosi on 4/27/17.
//  Copyright © 2017 Alexander Vallorosi. All rights reserved.
//

#import "RHKActivity.h"
#import "RHKQueries.h"
#import "RHKUtils.h"

@implementation RCTAppleHealthKit (Activity)

- (void)activity_getActiveEnergyBurned:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    HKQuantityType *quantityType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned];
    NSDate *startDate = [RCTAppleHealthKit dateFromOptions:input key:@"startDate" withDefault:nil];
    NSDate *endDate = [RCTAppleHealthKit dateFromOptions:input key:@"endDate" withDefault:[NSDate date]];
    HKUnit *unit = [HKUnit kilocalorieUnit];

    if(startDate == nil){
        callback(@[RCTMakeError(@"startDate is required in options", nil, nil)]);
        return;
    }
    NSPredicate * predicate = [RCTAppleHealthKit predicateForSamplesBetweenDates:startDate endDate:endDate];

    [self fetchQuantitySamplesOfType:quantityType
                                unit:unit
                           predicate:predicate
                           ascending:false
                               limit:HKObjectQueryNoLimit
                          completion:^(NSArray *results, NSError *error) {
                              if(results){
                                  callback(@[[NSNull null], results]);
                                  return;
                              } else {
                                  NSLog(@"error getting active energy burned samples: %@", error);
                                  callback(@[RCTMakeError(@"error getting active energy burned samples", nil, nil)]);
                                  return;
                              }
                          }];
}

- (void)activity_getExerciseMinutes:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    HKQuantityType *quantityType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierAppleExerciseTime];
    NSDate *startDate = [RCTAppleHealthKit dateFromOptions:input key:@"startDate" withDefault:nil];
    NSDate *endDate = [RCTAppleHealthKit dateFromOptions:input key:@"endDate" withDefault:[NSDate date]];
    HKUnit *unit = [HKUnit minuteUnit];
    
    if(startDate == nil){
        callback(@[RCTMakeError(@"startDate is required in options", nil, nil)]);
        return;
    }
    NSPredicate * predicate = [RCTAppleHealthKit predicateForSamplesBetweenDates:startDate endDate:endDate];
    
    [self fetchQuantitySamplesOfType:quantityType
                                unit:unit
                           predicate:predicate
                           ascending:false
                               limit:HKObjectQueryNoLimit
                          completion:^(NSArray *results, NSError *error) {
                              if(results){
                                  callback(@[[NSNull null], results]);
                                  return;
                              } else {
                                  NSLog(@"error getting exercise minutes samples: %@", error);
                                  callback(@[RCTMakeError(@"error getting exercise minutes samples", nil, nil)]);
                                  return;
                              }
                          }];
}

@end

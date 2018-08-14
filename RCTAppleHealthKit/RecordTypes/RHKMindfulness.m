//
//  RCTAppleHealthKit+Methods_Mindfulness.m
//  RCTAppleHealthKit
//
//


#import "RHKMindfulness.h"
#import "RHKQueries.h"
#import "RHKUtils.h"

@implementation RCTAppleHealthKit (Mindfulness)

- (void)mindfulness_getMindfulMinutes:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    HKCategoryType *categoryType = [HKCategoryType categoryTypeForIdentifier: HKCategoryTypeIdentifierMindfulSession];
    NSDate *startDate = [RCTAppleHealthKit dateFromOptions:input key:@"startDate" withDefault:nil];
    NSDate *endDate = [RCTAppleHealthKit dateFromOptions:input key:@"endDate" withDefault:[NSDate date]];
    HKUnit *unit = [HKUnit minuteUnit];
    
    if(startDate == nil){
        callback(@[RCTMakeError(@"startDate is required in options", nil, nil)]);
        return;
    }
    NSPredicate * predicate = [RCTAppleHealthKit predicateForSamplesBetweenDates:startDate endDate:endDate];
    
    [self fetchCategorySamplesOfType:categoryType
                                unit:unit
                           predicate:predicate
                           ascending:false
                               limit:HKObjectQueryNoLimit
                          completion:^(NSArray *results, NSError *error) {
                              if(results){
                                  callback(@[[NSNull null], results]);
                                  return;
                              } else {
                                  NSLog(@"error getting mindfulness minutes samples: %@", error);
                                  callback(@[RCTMakeError(@"error getting mindfulness minutes samples", nil, nil)]);
                                  return;
                              }
                          }];
}

- (void)mindfulness_saveMindfulSession:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    double value = [RCTAppleHealthKit doubleFromOptions:input key:@"value" withDefault:(double)0];
    NSDate *startDate = [RCTAppleHealthKit dateFromOptions:input key:@"startDate" withDefault:nil];
    NSDate *endDate = [RCTAppleHealthKit dateFromOptions:input key:@"endDate" withDefault:[NSDate date]];

    if(startDate == nil || endDate == nil){
        callback(@[RCTMakeError(@"startDate and endDate are required in options", nil, nil)]);
        return;
    }

    HKCategoryType *type = [HKCategoryType categoryTypeForIdentifier: HKCategoryTypeIdentifierMindfulSession];
    HKCategorySample *sample = [HKCategorySample categorySampleWithType:type value:value startDate:startDate endDate:endDate];


    [self.healthStore saveObject:sample withCompletion:^(BOOL success, NSError *error) {
        if (!success) {
            NSLog(@"An error occured saving the mindful session sample %@. The error was: %@.", sample, error);
            callback(@[RCTMakeError(@"An error occured saving the mindful session sample", error, nil)]);
            return;
        }
        callback(@[[NSNull null], @(value)]);
    }];

}

@end

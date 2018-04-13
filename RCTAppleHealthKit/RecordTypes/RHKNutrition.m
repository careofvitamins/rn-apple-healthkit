//
//  RCTAppleHealthKit+Methods_Dietary.m
//  RCTAppleHealthKit
//
//  Created by Greg Wilson on 2016-06-26.
//  Copyright © 2016 Greg Wilson. All rights reserved.
//

#import <React/RCTBridgeModule.h>
#import <React/RCTEventDispatcher.h>

#import "RHKNutrition.h"
#import "RHKQueries.h"
#import "RHKUtils.h"

@implementation RCTAppleHealthKit (Nutrition)

- (void)saveFood:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    NSString *foodName = [RCTAppleHealthKit stringFromOptions:input key:@"foodName" withDefault:nil];
    NSString *mealName = [RCTAppleHealthKit stringFromOptions:input key:@"mealType" withDefault:nil];
    NSDate *recordedAt = [RCTAppleHealthKit dateFromOptions:input key:@"date" withDefault:[NSDate date]];
    NSArray *quantities = [RCTAppleHealthKit arrayFromOptions:input key:@"quantities" withDefault:@[]];
    
    NSDictionary *metadata = @{
        HKMetadataKeyFoodType: foodName,
        @"HKFoodMeal": mealName, // Breakfast, Lunch, Dinner, or Snacks
    };
    
    NSMutableSet *quantitySamples = [[NSMutableSet alloc] init];

    for (NSDictionary *ingredientQuantity in quantities) {
        NSString *type = [RCTAppleHealthKit stringFromOptions:ingredientQuantity key:@"type" withDefault:nil];
        double quantity = [RCTAppleHealthKit doubleFromOptions:ingredientQuantity key:@"quantity" withDefault:(double)0];
        NSString *unitString = [RCTAppleHealthKit stringFromOptions:ingredientQuantity key:@"unit" withDefault:nil];
        
        if (type == nil || unitString == nil || quantity == 0) {
            continue;
        }
        
        HKQuantityTypeIdentifier typeIdentifier = [self getQuantityTypeIdentifier:type];
        HKUnit *unit = [HKUnit unitFromString:unitString];
        
        HKQuantitySample* sample = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:typeIdentifier]
                                                                   quantity:[HKQuantity quantityWithUnit:unit doubleValue:quantity]
                                                                  startDate:recordedAt
                                                                    endDate:recordedAt
                                                                   metadata:metadata];
        
        [quantitySamples addObject:sample];
    }

    // Combine nutritional data into a food correlation //
    HKCorrelation* correlation = [HKCorrelation correlationWithType:[HKCorrelationType correlationTypeForIdentifier:HKCorrelationTypeIdentifierFood]
                                                            startDate:recordedAt
                                                            endDate:recordedAt
                                                            objects:quantitySamples
                                                            metadata:metadata];

    [self.healthStore saveObject:correlation withCompletion:^(BOOL success, NSError *error) {
        if (!success) {
            NSLog(@"An error occured saving the food sample %@. The error was: ", error);
            callback(@[RCTMakeError(@"An error occured saving the food sample", error, nil)]);
            return;
        }
        callback(@[[NSNull null], @true]);
    }];
}

- (void)saveWater:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    NSDate *timeWaterWasConsumed = [RCTAppleHealthKit dateFromOptions:input key:@"date" withDefault:[NSDate date]];
    double waterValue = [RCTAppleHealthKit doubleFromOptions:input key:@"water" withDefault:(double)0];

    HKQuantitySample* water = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryWater]
                                                                quantity:[HKQuantity quantityWithUnit:[HKUnit literUnit] doubleValue:waterValue]
                                                                startDate:timeWaterWasConsumed
                                                                endDate:timeWaterWasConsumed
                                                                metadata:nil];

    // Save the water Sample to HealthKit //
    [self.healthStore saveObject:water withCompletion:^(BOOL success, NSError *error) {
        if (!success) {
            NSLog(@"An error occured saving the water sample %@. The error was: ", error);
            callback(@[RCTMakeError(@"An error occured saving the water sample", error, nil)]);
            return;
        }
        callback(@[[NSNull null], @true]);
    }];
}

@end

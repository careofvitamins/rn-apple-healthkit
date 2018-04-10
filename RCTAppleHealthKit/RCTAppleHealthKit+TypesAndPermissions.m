//
//  RCTAppleHealthKit+TypesAndPermissions.m
//  RCTAppleHealthKit
//
//  Created by Greg Wilson on 2016-06-26.
//  Copyright © 2016 Greg Wilson. All rights reserved.
//

#import "RCTAppleHealthKit+TypesAndPermissions.h"

@implementation RCTAppleHealthKit (TypesAndPermissions)


#pragma mark - HealthKit Permissions
    
- (NSDictionary *)getIOS11PermissionsDictionary {
    if (@available(iOS 11.0, *)) {
        NSDictionary *permissions = @{
            @"RestingHeartRate" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRestingHeartRate]
        };
        
        return permissions;
    }
    
    return @{};
}
    
- (NSDictionary *)getPermissionsDictionary {
    NSDictionary *permissions = @{
        // Activity
        @"ActiveEnergyBurned" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned],
        @"BasalEnergyBurned" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBasalEnergyBurned],
        @"DistanceCycling" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceCycling],
        @"DistanceWalkingRunning" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning],
        @"ExerciseMinutes" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierAppleExerciseTime],
        @"FlightsClimbed" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierFlightsClimbed],
        @"NikeFuel" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierNikeFuel],
        @"Steps" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount],
        @"StepCount" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount],

        // Body Measurements
        @"Height" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight],
        @"BodyFatPercentage" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyFatPercentage],
        @"BodyMass" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass],
        @"BodyMassIndex" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMassIndex],
        @"LeanBodyMass" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierLeanBodyMass],
        @"Weight" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass],
        
        // Characteristics
        @"BiologicalSex" : [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierBiologicalSex],
        @"DateOfBirth" : [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierDateOfBirth],
        
        // Mindfulness
        @"MindfulSession" : [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierMindfulSession],
        
        // Nutrition
        @"Biotin" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryBiotin],
        @"Caffeine" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCaffeine],
        @"Calcium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCalcium],
        @"Carbohydrates" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCarbohydrates],
        @"Chloride" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryChloride],
        @"Cholesterol" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCholesterol],
        @"Copper" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCopper],
        @"DietaryEnergy" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryEnergyConsumed],
        @"EnergyConsumed" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryEnergyConsumed],
        @"FatMonounsaturated" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatMonounsaturated],
        @"FatPolyunsaturated" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatPolyunsaturated],
        @"FatSaturated" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatSaturated],
        @"FatTotal" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatTotal],
        @"Fiber" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFiber],
        @"Folate" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFolate],
        @"Iodine" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryIodine],
        @"Iron" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryIron],
        @"Magnesium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryMagnesium],
        @"Manganese" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryManganese],
        @"Molybdenum" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryMolybdenum],
        @"Niacin" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryNiacin],
        @"PantothenicAcid" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPantothenicAcid],
        @"Phosphorus" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPhosphorus],
        @"Potassium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPotassium],
        @"Protein" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryProtein],
        @"Riboflavin" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryRiboflavin],
        @"Selenium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySelenium],
        @"Sodium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySodium],
        @"Sugar" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySugar],
        @"Thiamin" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryThiamin],
        @"VitaminA" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminA],
        @"VitaminB12" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminB12],
        @"VitaminB6" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminB6],
        @"VitaminC" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminC],
        @"VitaminD" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminD],
        @"VitaminE" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminE],
        @"VitaminK" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminK],
        @"Zinc" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryZinc],
        @"Water" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryWater],
        
        // Results
        @"BloodGlucose" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodGlucose],
        
        // Sleep
        @"SleepAnalysis" : [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierSleepAnalysis],
        
        // Vitals
        @"BloodPressureSystolic" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureSystolic],
        @"BloodPressureDiastolic" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureDiastolic],
        @"BodyTemperature" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyTemperature],
        @"HeartRate" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate],
        @"RespiratoryRate" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRespiratoryRate],
    };
    
    return permissions;
}

- (NSSet *)getPermissions:(NSArray *)options {
    NSDictionary *defaultPermissionsDictionary = [self getPermissionsDictionary];
    NSDictionary *ios11PermissionsDictionary = [self getIOS11PermissionsDictionary];
    NSMutableDictionary *permissionsDictionary = [[NSMutableDictionary alloc] init];
    
    [permissionsDictionary addEntriesFromDictionary:defaultPermissionsDictionary];
    [permissionsDictionary addEntriesFromDictionary:ios11PermissionsDictionary];
    
    NSMutableSet *permissionSet = [NSMutableSet setWithCapacity:1];
    
    for (int i = 0; i < [options count]; i++) {
        NSString *key = options[i];
        HKObjectType *value = [permissionsDictionary objectForKey:key];
        
        if (value == nil) {
            continue;
        }

        [permissionSet addObject:value];
    }
    
    return permissionSet;
}

@end

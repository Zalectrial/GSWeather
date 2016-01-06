//
//  WeatherTime+CoreDataProperties.h
//  GSWeather
//
//  Created by Gridstone on 6/01/2016.
//  Copyright © 2016 Gridstone. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "WeatherTime.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeatherTime (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *summary;
@property (nullable, nonatomic, retain) NSString *icon;
@property (nullable, nonatomic, retain) NSNumber *precipIntensity;
@property (nullable, nonatomic, retain) NSNumber *precipProbability;
@property (nullable, nonatomic, retain) NSString *precipType;
@property (nullable, nonatomic, retain) NSNumber *temperature;
@property (nullable, nonatomic, retain) NSNumber *apparentTemp;
@property (nullable, nonatomic, retain) NSNumber *dewPoint;
@property (nullable, nonatomic, retain) NSNumber *humiditiy;
@property (nullable, nonatomic, retain) NSNumber *windSpeed;
@property (nullable, nonatomic, retain) NSNumber *cloudCover;
@property (nullable, nonatomic, retain) NSDate *time;

@end

NS_ASSUME_NONNULL_END

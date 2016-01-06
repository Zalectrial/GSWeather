//
//  WeatherDay+CoreDataProperties.h
//  GSWeather
//
//  Created by Gridstone on 5/01/2016.
//  Copyright © 2016 Gridstone. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "WeatherDay.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeatherDay (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *summary;
@property (nullable, nonatomic, retain) NSString *icon;
@property (nullable, nonatomic, retain) NSNumber *precipIntensity;
@property (nullable, nonatomic, retain) NSString *precipType;
@property (nullable, nonatomic, retain) NSNumber *dewPoint;
@property (nullable, nonatomic, retain) NSNumber *humidity;
@property (nullable, nonatomic, retain) NSNumber *windSpeed;
@property (nullable, nonatomic, retain) NSNumber *cloudCover;
@property (nullable, nonatomic, retain) NSDate *sunrise;
@property (nullable, nonatomic, retain) NSDate *sunset;
@property (nullable, nonatomic, retain) NSNumber *moonPhase;
@property (nullable, nonatomic, retain) NSNumber *minTemp;
@property (nullable, nonatomic, retain) NSDate *minTempTime;
@property (nullable, nonatomic, retain) NSNumber *maxTemp;
@property (nullable, nonatomic, retain) NSDate *maxTempTime;
@property (nullable, nonatomic, retain) NSNumber *apparentMinTemp;
@property (nullable, nonatomic, retain) NSDate *apparentMinTempTime;
@property (nullable, nonatomic, retain) NSNumber *apparentMaxTemp;
@property (nullable, nonatomic, retain) NSDate *apparentMaxTempTime;

@end

NS_ASSUME_NONNULL_END

//
//  Weather+CoreDataProperties.h
//  GSWeather
//
//  Created by Gridstone on 5/01/2016.
//  Copyright © 2016 Gridstone. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Weather.h"

NS_ASSUME_NONNULL_BEGIN

@interface Weather (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *longitude;
@property (nullable, nonatomic, retain) NSNumber *latitude;
@property (nullable, nonatomic, retain) NSString *timezone;
@property (nullable, nonatomic, retain) NSNumber *offset;
@property (nullable, nonatomic, retain) WeatherTime *currentWeather;
@property (nullable, nonatomic, retain) NSSet<WeatherDay *> *dailyWeather;
@property (nullable, nonatomic, retain) NSSet<WeatherTime *> *hourlyWeather;

@end

@interface Weather (CoreDataGeneratedAccessors)

- (void)addDailyWeatherObject:(WeatherDay *)value;
- (void)removeDailyWeatherObject:(WeatherDay *)value;
- (void)addDailyWeather:(NSSet<WeatherDay *> *)values;
- (void)removeDailyWeather:(NSSet<WeatherDay *> *)values;

- (void)addHourlyWeatherObject:(WeatherTime *)value;
- (void)removeHourlyWeatherObject:(WeatherTime *)value;
- (void)addHourlyWeather:(NSSet<WeatherTime *> *)values;
- (void)removeHourlyWeather:(NSSet<WeatherTime *> *)values;

@end

NS_ASSUME_NONNULL_END

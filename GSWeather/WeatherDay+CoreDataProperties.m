//
//  WeatherDay+CoreDataProperties.m
//  GSWeather
//
//  Created by Gridstone on 5/01/2016.
//  Copyright © 2016 Gridstone. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "WeatherDay+CoreDataProperties.h"

@implementation WeatherDay (CoreDataProperties)

@dynamic date;
@dynamic summary;
@dynamic icon;
@dynamic precipIntensity;
@dynamic precipType;
@dynamic dewPoint;
@dynamic humidity;
@dynamic windSpeed;
@dynamic cloudCover;
@dynamic sunrise;
@dynamic sunset;
@dynamic moonPhase;
@dynamic minTemp;
@dynamic minTempTime;
@dynamic maxTemp;
@dynamic maxTempTime;
@dynamic apparentMinTemp;
@dynamic apparentMinTempTime;
@dynamic apparentMaxTemp;
@dynamic apparentMaxTempTime;

@end

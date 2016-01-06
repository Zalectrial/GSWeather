//
//  WeatherViewController.m
//  GSWeather
//
//  Created by Megan Efron on 4/01/2016.
//  Copyright © 2016 Gridstone. All rights reserved.
//

#import "WeatherViewController.h"
#import "UIColor+Extended.h"
#import "UIFont+Extended.h"
#import "Weather.h"
#import "WeatherTime.h"
#import "WeatherDay.h"
#import <MagicalRecord/MagicalRecord.h>

@interface WeatherViewController ()     <UITableViewDataSource>
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *weatherImage;
@property (nonatomic, strong) UILabel *temperatureLabel;
@property (nonatomic, strong) UILabel *weatherTypeLabel;
@property (nonatomic, strong) UILabel *weatherMinMax;
@property (nonatomic, strong) UILabel *weatherDate;
@property (nonatomic, strong) UITableView *weatherTable;
@end

@implementation WeatherViewController


#pragma mark - Setup

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    
    [self viewSetup];
    [self createData];
}

//(Sets up the appearance of the view, adding the components)
- (void)viewSetup
{
    //Gradient Color
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = @[(id)[[UIColor topColor] CGColor], (id)[[UIColor bottomColor] CGColor]];
    [self.view.layer insertSublayer:gradient atIndex:0];
    
    // Title Label
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont screenTitleFont];
    self.titleLabel.text = @"Melbourne, AU";
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.titleLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.view addSubview:self.titleLabel];
    
    //Weather Image
    UIImage *weather = [UIImage imageNamed:@"clear-day"];
    self.weatherImage = [[UIImageView alloc] initWithImage:weather];
    self.weatherImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.weatherImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.weatherImage];
    
    //Temperature Label
    self.temperatureLabel = [[UILabel alloc] init];
    self.temperatureLabel.textColor = [UIColor textColor];
    self.temperatureLabel.font = [UIFont bigTitleFont];
    self.temperatureLabel.text = @"17.6°";
    self.temperatureLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.temperatureLabel];
    
    //Weather Type Label
    self.weatherTypeLabel = [[UILabel alloc] init];
    self.weatherTypeLabel.textColor = [UIColor textColor];
    self.weatherTypeLabel.font = [UIFont smallTitleFont];
    self.weatherTypeLabel.text = @"Clear Day";
    self.weatherTypeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.weatherTypeLabel];
    
    //Weather Min/Max Label
    self.weatherMinMax = [[UILabel alloc] init];
    self.weatherMinMax.textColor = [UIColor whiteColor];
    self.weatherMinMax.font = [UIFont smallTitleFont];
    self.weatherMinMax.text = @"15°/24°";
    self.weatherMinMax.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.weatherMinMax];
    
    //Weather Date Label
    self.weatherDate = [[UILabel alloc] init];
    self.weatherDate.textColor = [UIColor whiteColor];
    self.weatherDate.font = [UIFont bodyFont];
    self.weatherDate.text = @"Mon, 4 Jan";
    self.weatherDate.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.weatherDate];
    
    //Weather Table View
    self.weatherTable = [[UITableView alloc] init];
    self.weatherTable.translatesAutoresizingMaskIntoConstraints = NO;
    self.weatherTable.dataSource = self;
    [self.view addSubview:self.weatherTable];
    self.weatherTable.backgroundColor = [UIColor clearColor];
    
    //(activate all constraints in the array)
    [NSLayoutConstraint activateConstraints:@[
                                              
                                              // Title Label
                                              [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                           attribute:NSLayoutAttributeCenterX
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.view
                                                                           attribute:NSLayoutAttributeCenterX
                                                                          multiplier:1.0
                                                                            constant:0],
                                              [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                           attribute:NSLayoutAttributeTop
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.view
                                                                           attribute:NSLayoutAttributeTop
                                                                          multiplier:1.0
                                                                            constant:20],
                                              
                                              // Weather Image
                                              [NSLayoutConstraint constraintWithItem:self.weatherImage
                                                                           attribute:NSLayoutAttributeCenterX
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.view
                                                                           attribute:NSLayoutAttributeCenterX
                                                                          multiplier:1.0
                                                                            constant:0],
                                              [NSLayoutConstraint constraintWithItem:self.weatherImage
                                                                           attribute:NSLayoutAttributeTop
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.titleLabel
                                                                           attribute:NSLayoutAttributeBottom
                                                                          multiplier:1.0
                                                                            constant:20],
                                              [NSLayoutConstraint constraintWithItem:self.weatherImage
                                                                           attribute:NSLayoutAttributeWidth
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.view
                                                                           attribute:NSLayoutAttributeWidth
                                                                          multiplier:1.0
                                                                            constant:0],
                                              [NSLayoutConstraint constraintWithItem:self.weatherImage
                                                                           attribute:NSLayoutAttributeBottom
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.temperatureLabel
                                                                           attribute:NSLayoutAttributeTop
                                                                          multiplier:1.0
                                                                            constant:-20],
                                              
                                              //Temperature Label
                                              [NSLayoutConstraint constraintWithItem:self.temperatureLabel
                                                                           attribute:NSLayoutAttributeCenterX
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.view
                                                                           attribute:NSLayoutAttributeCenterX
                                                                          multiplier:1.0
                                                                            constant:0],
                                              [NSLayoutConstraint constraintWithItem:self.temperatureLabel
                                                                           attribute:NSLayoutAttributeCenterY
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.view
                                                                           attribute:NSLayoutAttributeCenterY
                                                                          multiplier:1.0
                                                                            constant:-30],
                                              
                                              //Weather Type Label
                                              [NSLayoutConstraint constraintWithItem:self.weatherTypeLabel
                                                                           attribute:NSLayoutAttributeTop
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.temperatureLabel
                                                                           attribute:NSLayoutAttributeBottom
                                                                          multiplier:1.0
                                                                            constant:10],
                                              [NSLayoutConstraint constraintWithItem:self.weatherTypeLabel
                                                                           attribute:NSLayoutAttributeLeft
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.view
                                                                           attribute:NSLayoutAttributeLeft
                                                                          multiplier:1.0
                                                                            constant:25],
                                              
                                              //Weather Min/Max Label
                                              [NSLayoutConstraint constraintWithItem:self.weatherMinMax
                                                                           attribute:NSLayoutAttributeTop
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.temperatureLabel
                                                                           attribute:NSLayoutAttributeBottom
                                                                          multiplier:1.0
                                                                            constant:10],
                                              [NSLayoutConstraint constraintWithItem:self.weatherMinMax
                                                                           attribute:NSLayoutAttributeRight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.view
                                                                           attribute:NSLayoutAttributeRight
                                                                          multiplier:1.0
                                                                            constant:-30],
                                              
                                              //Weather Date Label
                                              [NSLayoutConstraint constraintWithItem:self.weatherDate
                                                                           attribute:NSLayoutAttributeTop
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.weatherMinMax
                                                                           attribute:NSLayoutAttributeBottom
                                                                          multiplier:1.0
                                                                            constant:5],
                                              [NSLayoutConstraint constraintWithItem:self.weatherDate
                                                                           attribute:NSLayoutAttributeRight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.view
                                                                           attribute:NSLayoutAttributeRight
                                                                          multiplier:1.0
                                                                            constant:-30],
                                              
                                              //Weather Table View
                                              [NSLayoutConstraint constraintWithItem:self.weatherTable
                                                                           attribute:NSLayoutAttributeTop
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.weatherDate
                                                                           attribute:NSLayoutAttributeBottom
                                                                          multiplier:1.0
                                                                            constant:10],
                                              [NSLayoutConstraint constraintWithItem:self.weatherTable
                                                                           attribute:NSLayoutAttributeBottom
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.view
                                                                           attribute:NSLayoutAttributeBottom
                                                                          multiplier:1.0
                                                                            constant:0],
                                              [NSLayoutConstraint constraintWithItem:self.weatherTable
                                                                           attribute:NSLayoutAttributeLeft
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.view
                                                                           attribute:NSLayoutAttributeLeft
                                                                          multiplier:1.0
                                                                            constant:0],
                                              [NSLayoutConstraint constraintWithItem:self.weatherTable
                                                                           attribute:NSLayoutAttributeRight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.view
                                                                           attribute:NSLayoutAttributeRight
                                                                          multiplier:1.0
                                                                            constant:0],
                                              
                                              ]];

}

- (void)createData
{
    //JSON File Dictionary
    //(creating a dictionary from the JSON weather file so that this dictionary can have data pulled from it to create weather objects)
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"weather" ofType:@"json"];
    NSData *content = [[NSData alloc] initWithContentsOfFile:filePath];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:content options:kNilOptions error:nil];
    
    //Weather Object
    //(pulling properties from the weather dictionary to assign them to a weather object)
    NSLog(@"%@", dictionary);
    Weather *weather = [Weather MR_createEntity];
    weather.longitude = [dictionary objectForKey:@"longitude"];
    weather.latitude = dictionary[@"latitude"];
    weather.timezone = dictionary[@"timezone"];
    weather.offset = dictionary[@"offset"];
    
    //WeatherTime currentWeather Object
    //(as above)
    WeatherTime *currentWeather = [WeatherTime MR_createEntity];
    //(taking a double value of the date/time property, inserting it into a method that creates a date from a time interval)
    currentWeather.time = [NSDate dateWithTimeIntervalSince1970:[dictionary[@"currently"][@"time"] doubleValue]];
    currentWeather.summary = dictionary[@"currently"][@"summary"];
    currentWeather.icon = dictionary[@"currently"][@"icon"];
    currentWeather.precipIntensity  = dictionary[@"currently"][@"precipIntensity"];
    currentWeather.precipProbability = dictionary[@"currently"][@"precipProbability"];
    currentWeather.precipType = dictionary[@"currently"][@"precipType"];
    currentWeather.temperature = dictionary[@"currently"][@"temperature"];
    currentWeather.apparentTemp = dictionary[@"currently"][@"apparentTemperature"];
    currentWeather.dewPoint = dictionary[@"currently"][@"dewPoint"];
    currentWeather.humiditiy = dictionary[@"currently"][@"humidity"];
    currentWeather.windSpeed = dictionary[@"currently"][@"windSpeed"];
    currentWeather.cloudCover = dictionary[@"currently"][@"cloudCover"];
    weather.currentWeather = currentWeather;
    
    //WeatherTime hourlyWeather Object
    //(as above but looping through all the daily dictionaries. These dictionaries have an array called data containing more dictionaries.
    //These properties are then assigned to hourly and day weather objects)
    for (NSDictionary *hourlyDictionary in dictionary[@"hourly"][@"data"]) {
        WeatherTime *hourlyWeather = [WeatherTime MR_createEntity];
        hourlyWeather.time = [NSDate dateWithTimeIntervalSince1970:[hourlyDictionary[@"time"] doubleValue]];
        hourlyWeather.summary = hourlyDictionary[@"summary"];
        hourlyWeather.icon = hourlyDictionary[@"icon"];
        hourlyWeather.precipIntensity  = hourlyDictionary[@"precipIntensity"];
        hourlyWeather.precipProbability = hourlyDictionary[@"precipProbability"];
        hourlyWeather.precipType = hourlyDictionary[@"precipType"];
        hourlyWeather.temperature = hourlyDictionary[@"temperature"];
        hourlyWeather.apparentTemp = hourlyDictionary[@"apparentTemperature"];
        hourlyWeather.dewPoint = hourlyDictionary[@"dewPoint"];
        hourlyWeather.humiditiy = hourlyDictionary[@"humidity"];
        hourlyWeather.windSpeed = hourlyDictionary[@"windSpeed"];
        hourlyWeather.cloudCover = hourlyDictionary[@"cloudCover"];
        
        [weather addHourlyWeatherObject:hourlyWeather];
    }
    
    //WeatherDay dailyWeather Object
    //(as above)
    for (NSDictionary *dailyDictionary in dictionary[@"daily"][@"data"]) {
        WeatherDay *dailyWeather = [WeatherDay MR_createEntity];
        dailyWeather.date = [NSDate dateWithTimeIntervalSince1970:[dailyDictionary[@"time"] doubleValue]];
        dailyWeather.summary = dailyDictionary[@"summary"];
        dailyWeather.icon = dailyDictionary[@"icon"];
        dailyWeather.precipIntensity = dailyDictionary[@"precipIntensity"];
        dailyWeather.precipType = dailyDictionary[@"precipType"];
        dailyWeather.dewPoint = dailyDictionary[@"dewPoint"];
        dailyWeather.humidity = dailyDictionary[@"humidity"];
        dailyWeather.windSpeed = dailyDictionary[@"windSpeed"];
        dailyWeather.cloudCover = dailyDictionary[@"cloudCover"];
        dailyWeather.sunrise = [NSDate dateWithTimeIntervalSince1970:[dailyDictionary[@"sunriseTime"] doubleValue]];
        dailyWeather.sunset = [NSDate dateWithTimeIntervalSince1970:[dailyDictionary[@"sunsetTime"] doubleValue]];
        dailyWeather.moonPhase = dailyDictionary[@"moonPhase"];
        dailyWeather.minTemp = dailyDictionary[@"temperatureMin"];
        dailyWeather.minTempTime = [NSDate dateWithTimeIntervalSince1970:[dailyDictionary[@"temperaterMinTime"] doubleValue]];
        dailyWeather.maxTemp = dailyDictionary[@"temperatureMax"];
        dailyWeather.maxTempTime = [NSDate dateWithTimeIntervalSince1970:[dailyDictionary[@"temperatureMaxTime"] doubleValue]];
        dailyWeather.apparentMinTemp = dailyDictionary[@"apparentTemperatureMin"];
        dailyWeather.apparentMinTempTime = [NSDate dateWithTimeIntervalSince1970:[dailyDictionary[@"apparentTemperatureMinTime"] doubleValue]];
        dailyWeather.apparentMaxTemp = dailyDictionary[@"apparentTemperatureMax"];
        dailyWeather.apparentMaxTempTime = [NSDate dateWithTimeIntervalSince1970:[dailyDictionary[@"apparentTemperatureMaxTime"] doubleValue]];
        
        [weather addDailyWeatherObject:dailyWeather];
    }
    
    [self updateUIWithWeather:weather];
    
}

- (void)updateUIWithWeather:(Weather *)weather
{
    self.titleLabel.text = weather.timezone;
    self.weatherImage.image = [UIImage imageNamed:weather.currentWeather.icon];
    self.temperatureLabel.text = [NSString stringWithFormat:@"%@",weather.currentWeather.temperature];
    self.weatherTypeLabel.text = weather.currentWeather.summary;
    //self.weatherMinMax.text = weather.dailyWeather.minTemp weather.dailyWeather.maxTemp;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEE, d MMM"];
    self.weatherDate.text = [formatter stringFromDate:weather.currentWeather.time];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
    
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"ReuseIdentifier"];
    cell.textLabel.text = @"Mon";
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont cellFont];
    cell.detailTextLabel.text = @"15°/24°";
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.font = [UIFont cellFont];
    cell.backgroundColor = [UIColor clearColor];
    cell.imageView.image = [UIImage imageNamed:@"clear-night-small"];
    return cell;
}

@end

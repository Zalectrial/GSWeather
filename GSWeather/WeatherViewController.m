//
//  WeatherViewController.m
//  GSWeather
//
//  Created by Megan Efron on 4/01/2016.
//  Copyright © 2016 Gridstone. All rights reserved.
//

#import "WeatherViewController.h"

@interface WeatherViewController ()     <UITableViewDelegate, UITableViewDataSource>

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.38 green:0.52 blue:0.92 alpha:1];
    
    // Title Label
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:22];
    titleLabel.text = @"Melbourne, AU";
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:titleLabel];
    
    //Weather Image
    UIImage *weather = [UIImage imageNamed:@"clear-day"];
    UIImageView *weatherImage = [[UIImageView alloc] initWithImage:weather];
    weatherImage.translatesAutoresizingMaskIntoConstraints = NO;
    weatherImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:weatherImage];
    
    //Temperature Label
    UILabel *temperatureLabel = [[UILabel alloc] init];
    temperatureLabel.textColor = [UIColor colorWithRed:0.62 green:0.98 blue:0.99 alpha:1];
    temperatureLabel.font = [UIFont systemFontOfSize:65 weight:UIFontWeightUltraLight];
    temperatureLabel.text = @"17.6°";
    temperatureLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:temperatureLabel];
    
    //Weather Type Label
    UILabel *weatherTypeLabel = [[UILabel alloc] init];
    weatherTypeLabel.textColor = [UIColor colorWithRed:0.62 green:0.98 blue:0.99 alpha:1];
    weatherTypeLabel.font = [UIFont systemFontOfSize:22 weight:UIFontWeightLight];
    weatherTypeLabel.text = @"Clear Day";
    weatherTypeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:weatherTypeLabel];
    
    //Weather Min/Max Label
    UILabel *weatherMinMax = [[UILabel alloc] init];
    weatherMinMax.textColor = [UIColor whiteColor];
    weatherMinMax.font = [UIFont systemFontOfSize:22 weight:UIFontWeightLight];
    weatherMinMax.text = @"15°/24°";
    weatherMinMax.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:weatherMinMax];
    
    //Weather Date Label
    UILabel *weatherDate = [[UILabel alloc] init];
    weatherDate.textColor = [UIColor whiteColor];
    weatherDate.font = [UIFont systemFontOfSize:16 weight:UIFontWeightLight];
    weatherDate.text = @"Mon, 4 Jan";
    weatherDate.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:weatherDate];
    
    //Weather Table View
    UITableView *weatherTable = [[UITableView alloc] init];
    weatherTable.translatesAutoresizingMaskIntoConstraints = NO;
    weatherTable.delegate = self;
    weatherTable.dataSource = self;
    [self.view addSubview:weatherTable];
    weatherTable.backgroundColor = [UIColor clearColor];
    
    // Title Label
    [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20].active = YES;
    
    // Weather Image
    [NSLayoutConstraint constraintWithItem:weatherImage attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:weatherImage attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20].active = YES;
    [NSLayoutConstraint constraintWithItem:weatherImage attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:weatherImage attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:temperatureLabel attribute:NSLayoutAttributeTop multiplier:1.0 constant:-20].active = YES;
    
    //Temperature Label
    [NSLayoutConstraint constraintWithItem:temperatureLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:temperatureLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-30].active = YES;
    
    //Weather Type Label
    [NSLayoutConstraint constraintWithItem:weatherTypeLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:temperatureLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10].active = YES;
    [NSLayoutConstraint constraintWithItem:weatherTypeLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:25].active = YES;
    
    //Weather Min/Max Label
    [NSLayoutConstraint constraintWithItem:weatherMinMax attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:temperatureLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10].active = YES;
    [NSLayoutConstraint constraintWithItem:weatherMinMax attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-30].active = YES;
    
    //Weather Date Label
    [NSLayoutConstraint constraintWithItem:weatherDate attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:weatherMinMax attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5].active = YES;
    [NSLayoutConstraint constraintWithItem:weatherDate attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-30].active = YES;
    
    //Weather Table View
    [NSLayoutConstraint constraintWithItem:weatherTable attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:weatherDate attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10].active = YES;
    [NSLayoutConstraint constraintWithItem:weatherTable attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:weatherTable attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:weatherTable attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0].active = YES;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"ReuseIdentifier"];
    cell.textLabel.text = @"Mon";
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightThin];
    cell.detailTextLabel.text = @"15°/24°";
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightThin];
    cell.backgroundColor = [UIColor clearColor];
    cell.imageView.image = [UIImage imageNamed:@"clear-night-small"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Something");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

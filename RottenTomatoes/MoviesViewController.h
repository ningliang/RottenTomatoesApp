//
//  MoviesViewController.h
//  RottenTomatoes
//
//  Created by Ning Liang on 3/16/14.
//  Copyright (c) 2014 Ning Liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoviesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *movies;

@end

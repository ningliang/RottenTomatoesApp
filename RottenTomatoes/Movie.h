//
//  Movie.h
//  RottenTomatoes
//
//  Created by Ning Liang on 3/16/14.
//  Copyright (c) 2014 Ning Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

// Basics
@property (nonatomic, assign) NSInteger rtId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger year;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSDate *releaseDate;
@property (nonatomic, strong) NSString *cast;

// Ratings
@property (nonatomic, strong) NSString *criticsRating;
@property (nonatomic, assign) NSInteger criticScore;
@property (nonatomic, strong) NSString *audienceRating;
@property (nonatomic, assign) NSInteger audienceScore;
@property (nonatomic, strong) NSString *criticsConsensus;

// Images
@property (nonatomic, strong) NSString *imageProfileLink;
@property (nonatomic, strong) NSString *imageThumbnailLink;
@property (nonatomic, strong) NSString *imageDetailedLink;
@property (nonatomic, strong) NSString *imageOriginalLink;

- (id)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)moviesWithArray:(NSArray *)array;

@end

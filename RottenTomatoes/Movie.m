//
//  Movie.m
//  RottenTomatoes
//
//  Created by Ning Liang on 3/16/14.
//  Copyright (c) 2014 Ning Liang. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.rtId = [dictionary[@"id"] intValue];
        self.title = dictionary[@"title"];
        self.year = [dictionary[@"year"] intValue];
        self.synopsis = dictionary[@"synopsis"];
        
        NSMutableArray *castNames = [[NSMutableArray alloc] init];
        for (NSDictionary *castMember in dictionary[@"abridged_cast"]) {
            NSString *name = castMember[@"name"];
            [castNames addObject:name];
        }
        self.cast = [castNames componentsJoinedByString:@", "];
        
        self.criticsConsensus = dictionary[@"critics_consensus"];
        
        NSDictionary *ratings = dictionary[@"ratings"];
        self.criticsRating = ratings[@"critics_rating"];
        self.criticScore = [ratings[@"critics_score"] intValue];
        self.audienceRating = ratings[@"audience_rating"];
        self.audienceScore = [ratings[@"audience_score"] intValue];
        
        NSDictionary *posters = dictionary[@"posters"];
        self.imageProfileLink = posters[@"profile"];
        self.imageThumbnailLink = posters[@"thumbnail"];
        self.imageDetailedLink = posters[@"detailed"];
        self.imageOriginalLink = posters[@"original"];
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        self.releaseDate = [dateFormat dateFromString:dictionary[@"release_dates"][@"theater"]];
    }
    
    return self;
}

+ (NSArray *)moviesWithArray:(NSArray *)array {
    NSMutableArray *movies = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in array) {
        Movie* movie = [[Movie alloc] initWithDictionary:dictionary];
        [movies addObject:movie];
    }
    
    return movies;
}

@end

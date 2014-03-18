//
//  MovieCell.m
//  RottenTomatoes
//
//  Created by Ning Liang on 3/16/14.
//  Copyright (c) 2014 Ning Liang. All rights reserved.
//

#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"

@interface MovieCell ()
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@end

@implementation MovieCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setMovie:(Movie *)movie {
    _movie = movie;
    self.movieTitleLabel.text = self.movie.title;
    self.synopsisLabel.text = self.movie.cast;
    self.ratingLabel.text = [NSString stringWithFormat:@"%d%%", self.movie.criticScore];
    
    [self.posterView setImageWithURL:[NSURL URLWithString:self.movie.imageOriginalLink]];
}

@end

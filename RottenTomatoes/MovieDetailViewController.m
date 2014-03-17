//
//  MovieDetailViewController.m
//  RottenTomatoes
//
//  Created by Ning Liang on 3/16/14.
//  Copyright (c) 2014 Ning Liang. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface MovieDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *largePosterView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UILabel *castLabel;

@end

@implementation MovieDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = self.movie.title;

    [self.largePosterView setImageWithURL:[NSURL URLWithString:self.movie.imageOriginalLink]];
    self.movieTitleLabel.text = self.movie.title;
    self.synopsisLabel.text = self.movie.synopsis;
    self.castLabel.text = self.movie.cast;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

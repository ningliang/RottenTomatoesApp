//
//  MoviesViewController.m
//  RottenTomatoes
//
//  Created by Ning Liang on 3/16/14.
//  Copyright (c) 2014 Ning Liang. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieDetailViewController.h"
#import "Movie.h"
#import "MovieCell.h"
#import "SVProgressHUD/SVProgressHUD.h"

@interface MoviesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *networkErrorLabel;
@property (weak, nonatomic) IBOutlet UIView *networkErrorBackground;

@end

@implementation MoviesViewController

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

    self.navigationItem.title = @"Movies";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 140;
    
    UINib *movieCellNib = [UINib nibWithNibName:@"MovieCell" bundle:nil];
    [self.tableView registerNib:movieCellNib forCellReuseIdentifier:@"MovieCell"];

    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    NSAttributedString *refreshTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    refreshControl.attributedTitle = refreshTitle;
    [refreshControl addTarget:self action:@selector(refreshMovies:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    
    [self refreshMovies:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];
    cell.movie = self.movies[indexPath.row];
    return cell;
}

- (void)refreshMovies:(UIRefreshControl *)refreshControlOrNil {

    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    NSAttributedString *refreshMessage = [[NSAttributedString alloc] initWithString:@"Fetching Movies"];
    [refreshControlOrNil setAttributedTitle:refreshMessage];
    
    self.networkErrorBackground.hidden = YES;
    self.networkErrorLabel.hidden = YES;
    
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=kxudhprxb22xxesjmrxhwm76";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            self.networkErrorBackground.hidden = NO;
            self.networkErrorLabel.hidden = NO;
        } else {
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSMutableArray *movies = [[NSMutableArray alloc] init];
            for (NSDictionary *dictionary in ((NSDictionary *)object)[@"movies"]) {
                Movie *movie = [[Movie alloc] initWithDictionary:dictionary];
                
                [movies addObject:movie];
            }
            
            self.movies = movies;
            [self.tableView reloadData];
        }
        
        [SVProgressHUD dismiss];
        
        [refreshControlOrNil endRefreshing];
        NSAttributedString *refreshTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
        [refreshControlOrNil setAttributedTitle:refreshTitle];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Movie *movie = self.movies[indexPath.row];
    MovieDetailViewController *movieDetailViewController = [[MovieDetailViewController alloc] init];
    movieDetailViewController.movie = movie;
    [self.navigationController pushViewController:movieDetailViewController animated:YES];
}

@end

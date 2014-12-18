//
//  ViewController.m
//  UIsearchDisplayDemo
//
//  Created by Andrew on 14-11-1.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ViewController.h"
#import "ResultViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>{
    UISearchBar *mySearchBar;
   
    ResultViewController *resultVc;
}
@property (nonatomic,strong)UISearchController *searchController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    // Create a UITableViewController to present search results since the actual view controller is not a subclass of UITableViewController in this case
    UITableViewController *searchResultsController = [[UITableViewController alloc] init];
    searchResultsController.view.backgroundColor=[UIColor whiteColor];
    // Init UISearchController with the search results controller
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:resultVc];
    
    // Link the search controller
    self.searchController.searchResultsUpdater = self;
    
    // This is obviously needed because the search bar will be contained in the navigation bar
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    
    // Required (?) to set place a search bar in a navigation bar
    self.searchController.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    
    // This is where you set the search bar in the navigation bar, instead of using table view's header ...
    self.navigationItem.titleView = self.searchController.searchBar;
    
    // To ensure search results controller is presented in the current view controller
    self.definesPresentationContext = YES;
    
    // Setting delegates and other stuff
    searchResultsController.tableView.dataSource = self;
    searchResultsController.tableView.delegate = self;
    self.searchController.delegate = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.searchBar.delegate = self;
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text=@"12";
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.searchController.hidesNavigationBarDuringPresentation=YES;
}

#pragma mark
#pragma mark--UIsearchResultUpdate
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSLog(@"updateSearchResultsForSearchController--");
}
- (void) searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller{
    NSLog(@"searchDisplayControllerWillBeginSearch");
}
- (void)didPresentSearchController:(UISearchController *)searchController{
    NSLog(@"didPresentSearchController");
}










@end

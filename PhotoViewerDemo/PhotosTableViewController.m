//
//  PhotosTableViewController.m
//  PhotoViewerDemo
//
//  Created by Victor  Adu on 5/1/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

#import "PhotosTableViewController.h"

@interface PhotosTableViewController () {

NSMutableArray *photos;
    
}

@end

@implementation PhotosTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Photos";
    
    //create array
    photos = [[NSMutableArray alloc] init];
    
    Photo *pic = [[Photo alloc] init];
    pic.name = @"Emerald Bay";
    pic.filename = @"emeraldbay"; //Ensure that filename matches exactly the name of the file you have in image Assets.
    pic.notes = @"Emerald Bay, one of Lake Tahoe's most popular and photogenic locations.";
    [photos addObject:pic]; //Finally add it to the array
    
    pic = [[Photo alloc] init];
    pic.name = @"A Joshuar Tree";
    pic.filename = @"joshuatree";
    pic.notes = @"A Joshua Tree in the Mojave Desert";
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    pic.name = @"Sunset in Ventura";
    pic.filename = @"sunset";
    pic.notes = @"Romantic sunset at the beach";
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    pic.name = @"Snowman at Lake Tahoe";
    pic.filename = @"snowman";
    pic.notes = @"Lake Tahoe gets 400 inches of snow every year.";
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    pic.name = @"Red Rock";
    pic.filename = @"redrock";
    pic.notes = @"Spectacular formations at Red Rock Canyon State Park";
    [photos addObject:pic];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return photos.count;  //Again, its 5. So you can say 'return 5;'
}

// What is in each cell of the row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Photo *current = [photos objectAtIndex:indexPath.row];
    cell.textLabel.text = [current name]; //grab the index of that particular cell in the row and set its name to
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    DisplayViewController *pvc = [segue destinationViewController];
    
    // Pass the selected object to the new view controller.
    //what's the selected cell?
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    Photo *c = photos [path.row];
    [pvc setCurrentPhoto:c];
    // or pvc.currentPhoto = c; // doesn't matter.
}


@end

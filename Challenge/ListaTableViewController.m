//
//  ListaTableViewController.m
//  Challenge
//
//  Created by Renan Cargnin on 2/6/14.
//  Copyright (c) 2014 Renan Cargnin. All rights reserved.
//

#import "ListaTableViewController.h"
#import "Local.h"
#import "MapaViewController.h"

@interface ListaTableViewController ()

@end

@implementation ListaTableViewController
@synthesize locais;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        locais = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.locais count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AtividadeCell"];
    
    Local *loc = (self.locais)[indexPath.row];
    NSLog(@"%d", [indexPath row]);
    cell.textLabel.text = loc.nome;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%02d:%02d", (int)loc.hora, (int)loc.minuto];
    
    return cell;
}

-(void)addItem:(Local*)local
{
    if (locais == nil) {
        locais = [[NSMutableArray alloc] init];
    }
    [locais addObject:local];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[locais indexOfObject:local] inSection:0];
    [self.tableView beginUpdates];
    [self.tableView
     insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    [self.tableView endUpdates];

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
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[self tabBarController] setSelectedIndex:0];
    MapaViewController *mapView = (MapaViewController *)[[[self tabBarController] viewControllers] firstObject];
    Local *l = [locais objectAtIndex:[indexPath row]];
    [mapView setMapRegion:[l coordenada]];
    NSLog(@"");
}

- (IBAction)MudarFonte:(id)sender {

    
    [self setFontFamily:@"American Typewriter" forView:self.view andSubViews:YES];
    
    
}

-(void)setFontFamily:(NSString*)fontFamily forView:(UIView*)view andSubViews:(BOOL)isSubViews
{
    if ([view isKindOfClass:[UILabel class]])
    {
        UILabel *lbl = (UILabel *)view;
        [lbl setFont:[UIFont fontWithName:fontFamily size:[[lbl font] pointSize]]];
    }
    
    if (isSubViews)
    {
        for (UIView *sview in view.subviews)
        {
            [self setFontFamily:fontFamily forView:sview andSubViews:YES];
        }
    }
}


@end

//
//  ListaTableViewController.h
//  Challenge
//
//  Created by Renan Cargnin on 2/6/14.
//  Copyright (c) 2014 Renan Cargnin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Local.h"

@interface ListaTableViewController : UITableViewController {
    NSMutableArray *locais;
}

-(void)addItem:(Local*)local;
@property (nonatomic, strong) NSMutableArray *locais;
- (IBAction)MudarFonte:(id)sender;

@end

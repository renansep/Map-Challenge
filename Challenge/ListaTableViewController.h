//
//  ListaTableViewController.h
//  Challenge
//
//  Created by Renan Cargnin on 2/6/14.
//  Copyright (c) 2014 Renan Cargnin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListaTableViewController : UITableViewController {
    NSMutableArray *locais;
}

@property (nonatomic, strong) NSMutableArray *locais;

@end

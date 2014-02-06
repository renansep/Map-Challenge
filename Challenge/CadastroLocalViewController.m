//
//  CadastroLocalViewController.m
//  Challenge
//
//  Created by Lucas da Silva Pereira on 06/02/14.
//  Copyright (c) 2014 Renan Cargnin. All rights reserved.
//

#import "CadastroLocalViewController.h"
#import "AppDelegate.h"
#import "Local.h"

@interface CadastroLocalViewController ()

@end

@implementation CadastroLocalViewController
@synthesize descricao;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    NSLog(@"fdsad");
    [super viewDidLoad];
    _txtDescricao.text = descricao;
    NSLog(@"%@", descricao);
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fechaModal:(id)sender {
    [self dismissModalViewControllerAnimated: YES];
}

- (IBAction)cadastrarLocal:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(-23.616845,-46.796265);
    Local *loc = [[Local alloc] initWithNome:_txtDescricao.text andCoordenada:coord andHora:8 andMinuto:00];
    
    [appDelegate.listaTableViewControler.locais addObject:loc];
    [self dismissModalViewControllerAnimated: YES];
    
}
@end

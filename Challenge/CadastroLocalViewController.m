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
@synthesize descricao, coordenadas;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _lblEndereco.text = descricao;
    NSLog(@"%@", descricao);
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fechaModal:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cadastrarLocal:(id)sender {
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    int hora   = [[calendar components:NSHourCalendarUnit    fromDate:[_horario date]] hour];
    int minuto = [[calendar components:NSMinuteCalendarUnit  fromDate:[_horario date]] minute];
    Local *loc = [[Local alloc] initWithNome:_txtDescricao.text andCoordenada:coordenadas andHora:hora andMinuto:minuto];
    
    [appDelegate.listaTableViewControler addItem:loc];
    
    
    [appDelegate.mapaViewController setPontoAtualVermelho:_txtDescricao.text naHora:[NSString stringWithFormat:@"%02d:%02d", hora, minuto]];
    [self dismissModalViewControllerAnimated: YES];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return true;
}
@end

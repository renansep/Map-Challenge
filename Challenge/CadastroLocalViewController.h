//
//  CadastroLocalViewController.h
//  Challenge
//
//  Created by Lucas da Silva Pereira on 06/02/14.
//  Copyright (c) 2014 Renan Cargnin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CadastroLocalViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtDescricao;
@property (weak, nonatomic) IBOutlet UILabel *lblEndereco;
@property (nonatomic, retain) NSString *descricao;
@property (weak, nonatomic) IBOutlet UIDatePicker *horario;
@property (nonatomic) CLLocationCoordinate2D coordenadas;
- (IBAction)fechaModal:(id)sender;
- (IBAction)cadastrarLocal:(id)sender;

@end

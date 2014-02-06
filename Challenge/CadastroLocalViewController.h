//
//  CadastroLocalViewController.h
//  Challenge
//
//  Created by Lucas da Silva Pereira on 06/02/14.
//  Copyright (c) 2014 Renan Cargnin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CadastroLocalViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtDescricao;
@property (nonatomic, retain) NSString *descricao;
- (IBAction)fechaModal:(id)sender;
- (IBAction)cadastrarLocal:(id)sender;

@end

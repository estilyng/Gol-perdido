//
//  DetalhesView.m
//  Futebol
//
//  Created by Ricardo Silva on 19/01/14.
//  Copyright (c) 2014 Ricardo Silva. All rights reserved.
//

#import "DetalhesView.h"

@interface DetalhesView ()

@end

@implementation DetalhesView
@synthesize time;

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
  
    self.Titulo.text=[time nome];
    self.texto.text=[time descricao];
    NSURL *url=[NSURL URLWithString:[time url_foto]];
    NSData *data=[[NSData alloc]initWithContentsOfURL:url];
    UIImage *imagem=[[UIImage alloc]initWithData:data];
    self.imagem.image=imagem;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.texto resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)voltar:(id)sender {
    self.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

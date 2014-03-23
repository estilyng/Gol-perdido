//
//  DetalhesView.h
//  Futebol
//
//  Created by Ricardo Silva on 19/01/14.
//  Copyright (c) 2014 Ricardo Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"Time.h"

@interface DetalhesView : UIViewController{
    Time *time;
}
@property(nonatomic,retain)Time *time;
@property (strong, nonatomic) IBOutlet UILabel *Titulo;
@property (strong, nonatomic) IBOutlet UIImageView *imagem;
@property (strong, nonatomic) IBOutlet UITextView *texto;
- (IBAction)voltar:(id)sender;


@end

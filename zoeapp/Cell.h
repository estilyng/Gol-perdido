//
//  Cell.h
//  Futebol
//
//  Created by Ricardo Silva on 19/01/14.
//  Copyright (c) 2014 Ricardo Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *nome;
@property (strong, nonatomic) IBOutlet UIImageView *imagem;

@property (strong, nonatomic) IBOutlet UILabel *info;


@end

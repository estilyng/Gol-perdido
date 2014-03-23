//
//  Time.h
//  Futebol
//
//  Created by Ricardo Silva on 19/01/14.
//  Copyright (c) 2014 Ricardo Silva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Time : NSObject
{
    NSString *nome;
    NSString *descricao;
    NSString *url_foto;
}

@property(nonatomic,retain)NSString *nome;
@property(nonatomic, retain)NSString *descricao;
@property(nonatomic,retain)NSString *url_foto;

@end

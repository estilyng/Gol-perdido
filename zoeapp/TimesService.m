//
//  TimesService.m
//  Futebol
//
//  Created by Ricardo Silva on 19/01/14.
//  Copyright (c) 2014 Ricardo Silva. All rights reserved.
//

#import "TimesService.h"
#import"Time.h"
#import"SMXMLDocument.h"

@implementation TimesService


+(NSMutableArray *)getTimes{
    NSMutableArray *times=[[NSMutableArray alloc]init];
    for(int i=0; i<15; i++){
        Time *time=[[Time alloc]init];
        time.nome=[NSString stringWithFormat:@"Time %d",i];
        [times addObject:time];
    }
    return times;
}

+(NSMutableArray *)parser_DOM:(NSData *)data{
    if(!data || [data length]==0){
        NSLog(@"Nenhum Time Encontrado");
        return nil;
    }
    
    NSError *error;
    SMXMLDocument *document=[SMXMLDocument documentWithData:data error:&error];
    if(error){
        NSLog(@"Error while parsing the document: %@", error);
        return nil;
    }
    NSMutableArray *times=[[NSMutableArray alloc]init];
    
    SMXMLElement *tagTimes=document.root;
    
    for(SMXMLElement *tagTime in[tagTimes childrenNamed:@"Time"]){
        Time *time=[[Time alloc]init];
        time.nome=[tagTime valueWithPath:@"nome"];
        time.descricao=[tagTime valueWithPath:@"info"];
        time.url_foto=[tagTime valueWithPath:@"foto"];
        [times addObject:time];
    
    }
    return times;
}

@end

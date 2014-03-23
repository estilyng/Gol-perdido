//
//  TimesService.h
//  Futebol
//
//  Created by Ricardo Silva on 19/01/14.
//  Copyright (c) 2014 Ricardo Silva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimesService : NSObject{

}


+(NSMutableArray *)getTimes;
+(NSMutableArray *)parser_DOM:(NSData *)data;

@end

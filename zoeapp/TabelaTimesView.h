//
//  TabelaTimesView.h
//  Futebol
//
//  Created by Ricardo Silva on 19/01/14.
//  Copyright (c) 2014 Ricardo Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabelaTimesView : UIViewController<UITableViewDataSource, UITableViewDelegate,NSURLConnectionDataDelegate>
{
    NSMutableArray *times;
    NSMutableData *retorno;
}
@property(nonatomic,retain)NSMutableArray *times;

@property (strong, nonatomic) IBOutlet UITableView *tabela;
@end

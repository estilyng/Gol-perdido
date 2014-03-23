//
//  TabelaTimesView.m
//  Futebol
//
//  Created by Ricardo Silva on 19/01/14.
//  Copyright (c) 2014 Ricardo Silva. All rights reserved.
//

#import "TabelaTimesView.h"
#import "TimesService.h"
#import"Time.h"
#import"Cell.h"
#import"DetalhesView.h"

@interface TabelaTimesView ()

@end

@implementation TabelaTimesView
@synthesize tabela;
@synthesize times;

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
    
    self.title=@"Times";
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:8080/Futebol/"]];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
    retorno=[[NSMutableData alloc]init];
}

-(BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace{
    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust] || [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodDefault];

}

-(void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
   	if ([challenge previousFailureCount] == 0) {
        [[challenge sender] useCredential:[NSURLCredential credentialWithUser:@"Ricardo" password:@"123" persistence:NSURLCredentialPersistenceNone] forAuthenticationChallenge:challenge];
    } else {
        [[challenge sender] cancelAuthenticationChallenge:challenge];
    }
    
}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [retorno setLength:0];

}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [retorno appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    if([retorno length]>0){
        times=[TimesService parser_DOM:retorno];
    }
    if([times count]>0){
        [self.tabela reloadData];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [times count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier=@"Times";
     Cell *cell= [tabela dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell==Nil){
        cell=[[[NSBundle mainBundle]loadNibNamed:@"Cell" owner:self options:nil]objectAtIndex:0];
    }
    Time *time;
    NSInteger linha = indexPath.row;
    time=[times objectAtIndex:linha];
    cell.nome.text=[time nome];
    cell.info.text=[time descricao];
    NSURL *url=[NSURL URLWithString:[time url_foto]];
    NSData *data=[NSData dataWithContentsOfURL:url ];
    UIImage *imagem=[[UIImage alloc]initWithData:data];
    cell.imagem.image=imagem;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger linha=[indexPath row];
    Time *time;
    time=[times objectAtIndex:linha];
    DetalhesView *detalhes=[[DetalhesView alloc]init];
    detalhes.time=time;
    [self presentViewController:detalhes animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

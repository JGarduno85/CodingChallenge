//
//  RequestManager.m
//  CodingAssesment
//
//  Created by jose humberto partida garduño on 4/12/17.
//  Copyright © 2017 jose humberto partida garduño. All rights reserved.
//

#import "RequestManager.h"
#import "APIClient.h"
#import "MBProgressHUD.h"

@implementation RequestManager


+(instancetype)sharedInstance{
    static dispatch_once_t once;
    static RequestManager *instance;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

-(void)makeRequestDataDictionary:(NSDictionary*)data{
    if (data == nil)
    {
        if(self.delegate != nil){
            NSDictionary* userInfo = @{NSLocalizedDescriptionKey:NSLocalizedString(@"input for the request is not well formed",nil),
                                       NSLocalizedFailureReasonErrorKey:NSLocalizedString(@"the input text and data is nil these values won't produce any result from the request",nil)
                                       };
            [self.delegate searchFail:[NSError errorWithDomain:@"Bad input error" code:100 userInfo:userInfo]];
        }
    }
    __weak typeof(self) weakSelf = self;
    if(self.progressReferenceView != nil){
        [MBProgressHUD showHUDAddedTo:self.progressReferenceView animated:YES];
    }
    [[APIClient sharedInstance] makeRequestOnEndPoint:@"/software/acromine/dictionary.py" dataDictionary:data andSuccess:^(id response){
        if (weakSelf.delegate != nil){
            NSArray* results = ((NSArray*)response).firstObject;
            NSArray* acronymsArray = [results valueForKey:@"lfs"];
            if(weakSelf.progressReferenceView != nil){
                [MBProgressHUD hideHUDForView:weakSelf.progressReferenceView animated:YES];
            }
            if(acronymsArray == nil || acronymsArray.count == 0){
                acronymsArray = [[NSArray alloc] init];
            }
            [weakSelf.delegate searchCompletedWithSuccess:acronymsArray];
        }
    }andFail:^(NSError* error){
        if(weakSelf.progressReferenceView != nil){
            [MBProgressHUD hideHUDForView:weakSelf.progressReferenceView animated:YES];
        }
        [weakSelf.delegate searchFail:error];
    }];
}

@end

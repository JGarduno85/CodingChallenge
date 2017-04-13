//
//  APIClient.m
//  CodingAssesment
//
//  Created by jose humberto partida garduño on 4/12/17.
//  Copyright © 2017 jose humberto partida garduño. All rights reserved.
//

#import "APIClient.h"

@interface APIClient()

@property (nonatomic,strong) NSString* baseUrl;
@end


@implementation APIClient

+(instancetype)sharedInstance{
    static dispatch_once_t once;
    static APIClient *instance;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        self.baseUrl = [[NSBundle mainBundle] infoDictionary][@"BaseUrl"];
    }
    return self;
}


-(void)makeRequestOnEndPoint:(NSString*)endPoint dataDictionary:(NSDictionary*)data andSuccess:(void(^)(id))successBlock andFail:(void(^)(NSError*))failBlock{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSString* urlstr = [NSString stringWithFormat:@"%@%@",_baseUrl,endPoint];
    [manager GET:urlstr parameters:data success:^(AFHTTPRequestOperation *operation, id responseObject){
        NSError* error;
        NSDictionary* jsonData = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
        successBlock(jsonData);
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failBlock(error);
    }];
}




@end

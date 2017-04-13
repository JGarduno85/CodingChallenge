//
//  APIClient.h
//  CodingAssesment
//
//  Created by jose humberto partida garduño on 4/12/17.
//  Copyright © 2017 jose humberto partida garduño. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
/*!
@brief Wrapper of AFNetworking to perform the requests - responses
 */
@interface APIClient : NSObject

/*!
 @brief singleton instance
 */

+ (instancetype)sharedInstance;
/*!
@brief makes the actual request and handles the response
@param endPoint the webService endpoint to request
@param data the query string of the get request
@param successBlock handle the request success
@param failBlock handle the request failure
 */
-(void)makeRequestOnEndPoint:(NSString*)endPoint dataDictionary:(NSDictionary*)data andSuccess:(void(^)(id))successBlock andFail:(void(^)(NSError*))failBlock;

@end

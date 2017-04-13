//
//  RequestManager.h
//  CodingAssesment
//
//  Created by jose humberto partida garduño on 4/12/17.
//  Copyright © 2017 jose humberto partida garduño. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/*!
 @brief Delegate to pass the webservice response
 */
@protocol RequestManagerDelegate

@required

/*!
 @brief the web service responds
 @param response the actual service response
 */
-(void)searchCompletedWithSuccess:(id)response;
/*!
 @brief the server responds with some error or a timeout
 @param error the server error
 */
-(void)searchFail:(NSError*)error;

@end

/*!
 @brief handle the request and responses
 */
@interface RequestManager : NSObject

@property (nonatomic,assign) id<RequestManagerDelegate>delegate;
/*!
 @brief singleton instance
 */
+ (instancetype)sharedInstance;
/*!
 @brief View reference where the progress action will be add
 */
@property (nonatomic,weak) UIView* progressReferenceView;
/*!
 @brief make the request with the search criteria
 @param data the search criteria
 */
-(void)makeRequestDataDictionary:(NSDictionary*)data;


@end

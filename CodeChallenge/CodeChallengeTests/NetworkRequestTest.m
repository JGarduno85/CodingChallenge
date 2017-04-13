//
//  NetworkRequestTest.m
//  CodingAssesment
//
//  Created by jose humberto partida garduño on 4/12/17.
//  Copyright © 2017 jose humberto partida garduño. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RequestManager.h"

@interface NetworkRequestTest : XCTestCase <RequestManagerDelegate>

@end

@implementation NetworkRequestTest

XCTestExpectation* expectation;

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
     expectation = [self expectationWithDescription:@"Request expectation"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRequest {
    NSString* text = @"ASAP";
    [RequestManager sharedInstance].delegate = self;
    NSDictionary* data = [[NSDictionary alloc] initWithObjectsAndKeys:text,@"sf", nil];
    [[RequestManager sharedInstance] makeRequestDataDictionary:data];
    [self waitForExpectationsWithTimeout:2.0 handler:nil];
}
-(void)searchCompletedWithSuccess:(id)response{
    XCTAssertNotNil(response);
    NSArray* responseArray = (NSArray*) response;
    XCTAssertNotNil(responseArray);
    XCTAssertNotEqual(responseArray.count, 0);
    [expectation fulfill];
}

-(void)searchFail:(NSError *)error{
    XCTAssertNotNil(error);
    [expectation fulfill];
}


@end

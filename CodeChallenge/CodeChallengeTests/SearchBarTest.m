//
//  SearchBarTest.m
//  CodingAssesment
//
//  Created by jose humberto partida garduño on 4/12/17.
//  Copyright © 2017 jose humberto partida garduño. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AcronymSerachBarManager.h"


@interface SearchBarTest : XCTestCase

@end

@implementation SearchBarTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExampleEmptyCharacter{
    NSString* userInput = @"ASAP";
    BOOL result = [[AcronymSerachBarManager sharedInstance] validateSearchBarInputText:userInput];
    XCTAssertTrue(result);
}

-(void)testSearchSpecialCharacter{
    NSString* userInput = @"^";
    BOOL result = [[AcronymSerachBarManager sharedInstance] validateSearchBarInputText:userInput];
    XCTAssertFalse(result);
}

-(void)testSearchNumber{
    NSString* userInput = @"1234";
    BOOL result = [[AcronymSerachBarManager sharedInstance] validateSearchBarInputText:userInput];
    XCTAssertFalse(result);
}




@end

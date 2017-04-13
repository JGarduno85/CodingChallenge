//
//  AcronymSerachBarManager.h
//  CodingAssesment
//
//  Created by jose humberto partida garduño on 4/12/17.
//  Copyright © 2017 jose humberto partida garduño. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/*!
@brief manager that handles the search bar logic
 */

@interface AcronymSerachBarManager : NSObject <UISearchBarDelegate>

/*!
@brief singleton instance
 */
+ (instancetype)sharedInstance;

/*!
@brief it checks the searchbar input text and only allows letters, not numbers or special characters.
@param text : the text to validate
 */
-(BOOL)validateSearchBarInputText:(NSString*)text;

@end

//
//  TableViewDataSource.h
//  CodingAssesment
//
//  Created by jose humberto partida garduño on 4/12/17.
//  Copyright © 2017 jose humberto partida garduño. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/*!
 @brief handles the tableView Data
 */
@interface TableViewDataSource : NSObject <UITableViewDataSource>

/*!
 @brief the array data used to fill the tableview rows
 */
@property(nonatomic,strong) NSArray* data;

@end

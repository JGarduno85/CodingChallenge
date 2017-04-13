//
//  ViewController.h
//  CodingAssesment
//
//  Created by jose humberto partida garduño on 4/12/17.
//  Copyright © 2017 jose humberto partida garduño. All rights reserved.
//

#import <UIKit/UIKit.h>
/*!
 @brief main view controller
 */
@interface ViewController : UIViewController

/*!
 @brief reference to the searchBar
 */
@property (weak, nonatomic) IBOutlet UISearchBar *acronymSearchBar;

/*!
 @brief reference to the tableView
 */
@property (weak, nonatomic) IBOutlet UITableView *acronymTableView;

@end


//
//  TableViewDataSource.m
//  CodingAssesment
//
//  Created by jose humberto partida garduño on 4/12/17.
//  Copyright © 2017 jose humberto partida garduño. All rights reserved.
//

#import "TableViewDataSource.h"
#import "TableViewCell.h"


@interface TableViewDataSource() 



@end

@implementation TableViewDataSource

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return  @"Acronyms";
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TableViewCell class])];
    NSDictionary* dataDictionary = _data[indexPath.row];
    NSString* acronym = [dataDictionary valueForKey:@"lf"];
    cell.acronymlabel.text = acronym;
    return cell;
}


@end

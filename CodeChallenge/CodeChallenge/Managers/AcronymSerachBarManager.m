//
//  AcronymSerachBarManager.m
//  CodingAssesment
//
//  Created by jose humberto partida garduño on 4/12/17.
//  Copyright © 2017 jose humberto partida garduño. All rights reserved.
//

#import "AcronymSerachBarManager.h"
#import "RequestManager.h"
#import "APIClient.h"


@interface AcronymSerachBarManager()

@end


@implementation AcronymSerachBarManager

+(instancetype)sharedInstance{
    static dispatch_once_t once;
    static AcronymSerachBarManager *instance;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

-(BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    return [self validateSearchBarInputText:text];
}


-(BOOL)validateSearchBarInputText:(NSString*)text{
    if([text rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet]].length != 0 || [text isEqualToString:@""] || [text isEqualToString:@"\n"])
    {
        return YES;
    }
    else {
        return NO;
    }
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSString* text = searchBar.text;
    //The request needs this parameter to find the acronyms
    NSDictionary* data = @{@"sf":text};
    //the manager needs the view that will put the progess control and to dismiss the keyboard once the search button is pressed
    [[RequestManager sharedInstance].progressReferenceView endEditing:YES];
    //the manager handles the logic for the request, response. also handles the result parsing or error handle
    [[RequestManager sharedInstance] makeRequestDataDictionary:data];
}

@end

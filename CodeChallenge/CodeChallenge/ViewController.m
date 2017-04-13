//
//  ViewController.m
//  CodingAssesment
//
//  Created by jose humberto partida garduño on 4/12/17.
//  Copyright © 2017 jose humberto partida garduño. All rights reserved.
//

#import "ViewController.h"
#import "AcronymSerachBarManager.h"
#import "TableViewCell.h"
#import "TableViewDataSource.h"
#import "RequestManager.h"

@interface ViewController () <RequestManagerDelegate>

@property(nonatomic,strong) TableViewDataSource* dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupAcronymSearchBar];
    [self setupTableView];
    [self setupRequestManager];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
///@brief configure the request manager
-(void)setupRequestManager{
    [RequestManager sharedInstance].delegate = self;
    [RequestManager sharedInstance].progressReferenceView = self.view;
}

///@brief configure the acronymsearchBar
-(void)setupAcronymSearchBar{
    self.acronymSearchBar.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    self.acronymSearchBar.delegate = [AcronymSerachBarManager sharedInstance];
}

///@brief configure the TableView
-(void)setupTableView{
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
    [self.acronymTableView addGestureRecognizer:tapRecognizer];
    [self.acronymTableView registerNib:[UINib nibWithNibName:NSStringFromClass([TableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([TableViewCell class])];
    self.acronymTableView.rowHeight = UITableViewAutomaticDimension;
    self.acronymTableView.estimatedRowHeight = 44;
    self.dataSource = [[TableViewDataSource alloc] init];
    self.acronymTableView.dataSource = self.dataSource;
    self.acronymTableView.allowsSelection = NO;
}

///@brief delegate from the RequestManager to handle the response and show the data retrieved
-(void)searchCompletedWithSuccess:(id)response{
    NSArray* dataArray = (NSArray*)response;
    if(dataArray == nil || dataArray.count == 0){
        [self showAlertWithMessage:NSLocalizedString(@"The search doesn't retrieve any data", nil)];
        return;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        self.dataSource.data = dataArray;
        [self.acronymTableView reloadData];
    });
    
}
///@brief delegate from the RequestManager to handle the failure and show an alert
-(void)searchFail:(NSError *)error{
    NSString* message = NSLocalizedString(@"It appears a server error happend, please try again", nil);
    [self showAlertWithMessage:[NSString stringWithFormat:@"%@:%@",message,error.description]];
}

/*!
@brief create the alert and show the specific message
@param message : the text to display on the alert
*/
-(void)showAlertWithMessage:(NSString*)message{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Message",nil) message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* alertAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Ok", nil) style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:alertAction];
        [self presentViewController:alert animated:YES completion:nil];
    });
}


/// dismiss the keyboard if the user taps on the tableview
-(void)tapView:(id)sender{
    [self.view endEditing:YES];
}


@end

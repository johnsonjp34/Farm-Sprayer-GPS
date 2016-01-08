//
//  ViewController2.m
//  Farm Sprayer GPS
//
//  Created by Joshua Johnson on 12/17/15.
//  Copyright © 2015 Investor Direction. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ViewController2.h"
#import "ViewController.h"

@interface ViewController2 ()

@end

@implementation ViewController2



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//push data from viewcontroller to viewcontroller
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"cancel"]) {
        
        NSString *intro = @"Canceled";
        ViewController *vc = [segue destinationViewController];
        vc.cancelstring = intro;
    }
    
    //WHEN YOU HIT START BUTTON
    else if ([segue.identifier isEqualToString:@"start"]) {
      //get width
        NSString *width = _widthinput.text;
      //get field name
        NSString *fieldname = _fieldnameinput.text;
      //get comments
        NSString *comments = _commentsinput.text;
        //get units
        BOOL *units;
        BOOL linemode;
        if( _unitstoggle.isOn){
        
             units = YES;
        }
        else{
             units = NO;
        }
        
        if(_linetoggle.isOn){
            
            linemode = YES;
        }
        else{
            linemode = NO; }
        
        ViewController *vc = [segue destinationViewController];
        vc.widthstring = width;
        vc.unitsboo = units;
        vc.lineboo = linemode;
        vc.fieldnamestring = fieldname;
        vc.commentstring = comments;
    }
    
    
}


- (void)viewDidLoad
{
   
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

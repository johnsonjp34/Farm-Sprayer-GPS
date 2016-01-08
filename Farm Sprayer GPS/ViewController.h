//
//  ViewController.h
//  Farm Sprayer GPS
//
//  Created by Joshua Johnson on 8/18/15.
//  Copyright (c) 2015 Investor Direction. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <CoreLocation/CoreLocation.h>
#import <GoogleMaps/GoogleMaps.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate,UITextFieldDelegate, GMSMapViewDelegate>{
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
    CLLocationDirection course;
    CLLocationSpeed speed;
    
   
    
    
}



@property (weak, nonatomic) IBOutlet UIButton *clicky;

@property (strong, nonatomic) IBOutlet UITextField *myTextField;


@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIButton *rbutton;

@property (weak, nonatomic) IBOutlet UIButton *lightbarbutton;

@property (weak, nonatomic) IBOutlet UITextView *speedview;

@property (weak, nonatomic) IBOutlet UITextView *acreview;

@property (weak, nonatomic) IBOutlet UITextView *courseview;

@property (weak, nonatomic) IBOutlet UIImageView *arrowView;
@property (weak, nonatomic) IBOutlet UIButton *contrastbutton;

@property (weak, nonatomic) IBOutlet UIButton *clearbutton;

@property (weak, nonatomic) IBOutlet UIButton *centerbutton;

//objects and data passed from ViewController2, the data entry form, back to ViewController
@property (weak, nonatomic) IBOutlet UITextField *cancelmessage;
@property (weak, nonatomic) NSString  *cancelstring;
@property (weak, nonatomic) NSString  *widthstring;
@property (weak, nonatomic) NSString  *fieldnamestring;
@property (weak, nonatomic) NSString  *commentstring;
@property  BOOL *unitsboo;
@property  BOOL *lineboo;


//@property (weak, nonatomic) IBOutlet UITextField *widthIntervalView;

//@property (weak, nonatomic) IBOutlet UITextField *heightView;


@end

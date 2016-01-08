//
//  ViewController.m
//  Farm Sprayer GPS
//
//  Created by Joshua Johnson on 8/18/15.
//  Copyright (c) 2015 Investor Direction. All rights reserved.
//

#import "ViewController.h"




#import <math.h>

@import GoogleMaps;

@import CoreLocation;



@interface ViewController ()



@end

@implementation ViewController {
    GMSMapView *mapView_;
   GMSMarker *marker;
    GMSMarker *marker2;
    GMSMarker *markerA, *markerAA, *markerB, *markerBB, *markerC, *markerCC, *markerD, *markerDD, *markerE, *markerEE, *markerF, *markerFF, *markerG, *markerGG, *markerH, *markerHH, *markerI, *markerII, *markerJ, *markerJJ, *markerK, *markerKK, *markerL, *markerLL, *markerM, *markerMM, *markerN, *markerNN, *markerO, *markerOO, *markerP, *markerPP, *markerQ, *markerQQ, *markerR, *markerRR, *markerS, *markerSS, *markerT, *markerTT, *markerU, *markerUU, *markerV, *markerVV, *markerW, *markerWW, *markerX, *markerXX, *markerY, *markerYY, *markerZ, *markerZZ;
    
    //markers on left side
    
    GMSMarker *marker1, *marker11, *Marker2, *marker22, *marker3, *marker33, *marker4, *marker44, *marker5, *marker55, *marker6, *marker66, *marker7, *marker77, *marker8, *marker88, *marker9, *marker99, *marker10, *marker1010, *marker111, *marker1111, *marker12, *marker1212, *marker13, *marker1313, *marker14, *marker1414, *marker15, *marker1515, *marker16, *marker1616, *marker17, *marker1717, *marker18, *marker1818, *marker19, *marker1919, *marker20, *marker2020, *marker21, *marker2121, *marker222, *marker2222, *marker23, *marker2323, *marker24, *marker2424, *marker25, *marker2525;
    
    GMSCameraPosition *camera;
    NSString *banana;
    
    bool *paused;
    int pointNum;
    BOOL lightbar;
    
    CLLocationCoordinate2D positionofmarkerA;
    CLLocationCoordinate2D positionofmarkerB;
    double stringDouble;
    double distanceABline;
    double distanceACline;
    double distanceBCline;
    double height;
    double stringDoubleMultiplier;
    BOOL mapcontrast;
    UIImage *noarrows;
    UIImage *arrowup;
    UIImage *arrowrt1;
     UIImage *arrowrt2;
     UIImage *arrowrt3;
     UIImage *arrowrt4;
     UIImage *arrowlt1;
    UIImage *arrowlt2;
    UIImage *arrowlt3;
    UIImage *arrowlt4;
    BOOL mapFlipper;
    BOOL heightMagnitude;
    BOOL flip;
   
    NSMutableArray *pointArray;
    NSMutableArray *bearingArray;
    NSMutableArray *widthArray;
    CLLocationCoordinate2D lastPosition;
    CLLocationCoordinate2D last;
    
    CLLocationCoordinate2D currentPosition;
    
    CLLocationCoordinate2D previousac;
    CLLocationCoordinate2D currentac;
    
    double distancesph;
    
    GMSPolyline *headingIndicator;
    
}
@synthesize arrowView;

- (void)viewDidLoad {
    
    
    [self.navigationController setNavigationBarHidden:YES];
    
    // keep screen on
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
    
    [self CurrentLocationIdentifier];
    
    camera = [GMSCameraPosition cameraWithLatitude:38.911174
                                         longitude:-83.442401
                                              zoom:18];
    mapView_ = [GMSMapView mapWithFrame:self.view.bounds camera:camera];
    mapView_.myLocationEnabled = YES;
    [self.view insertSubview:mapView_ atIndex:0];
    
    
    
    // Creates a marker in the center of the map.
    
    
    
    //blue circle thingy and compass thingy and map center thingy
    mapView_.myLocationEnabled = YES;
    
    mapView_.settings.compassButton = YES;
    
    mapView_.settings.myLocationButton = YES;
    
    mapView_.delegate = self;
    
   mapView_.mapType = kGMSTypeHybrid;
    mapcontrast = NO;
    
    lightbar = NO;
    paused = true;
    
    flip = NO;
    
    mapFlipper=YES;
    heightMagnitude=YES;
    pointNum = 0;
    pointArray = [[NSMutableArray alloc] init];
    bearingArray = [[NSMutableArray alloc] init];
    widthArray = [[NSMutableArray alloc] init];
    
      lastPosition = kCLLocationCoordinate2DInvalid;
    _myTextField.text = _widthstring;
    banana = _widthstring;
    _cancelmessage.text = _cancelstring;
    
    // comments and field name can be accessed by _fieldnamestring and _commentstring
    
    if(_unitsboo == YES) {
        
        
        NSString *message = @"METRIC";
        
        UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:nil, nil];
        [toast show];
        
        int duration = 1; // duration in seconds
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [toast dismissWithClickedButtonIndex:0 animated:YES];
        });
         }
    
        else{
            
            NSString *message = @"STANDARD UNITS";
            
            UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:nil, nil];
            [toast show];
            
            int duration = 1; // duration in seconds
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                [toast dismissWithClickedButtonIndex:0 animated:YES];
            });
            
            
        }
    
  

    
    
    
   
    
}

- (IBAction)contrastcontroller:(id)sender {
    
    
    if(mapcontrast==NO){
        mapcontrast = YES;
        mapView_.mapType = kGMSTypeTerrain;    }
    else {
        mapcontrast = NO;
        mapView_.mapType = kGMSTypeHybrid;
    
    
    
    }
    
}














- (IBAction)centercontroller:(id)sender {
    
    
    if(flip == NO) {
        
        flip = YES;
        
        
        
        
        NSString *message = @"Map Locked to Center";
        
        UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:nil, nil];
        [toast show];
        
        int duration = 1; // duration in seconds
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [toast dismissWithClickedButtonIndex:0 animated:YES];
        });
        
    }
    
    else if(flip == YES)
    {
        flip = NO;
        
        NSString *message = @"Map Center OFF";
        
        UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:nil, nil];
        [toast show];
        
        int duration = 1; // duration in seconds
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [toast dismissWithClickedButtonIndex:0 animated:YES];
        });
        
        
        
    }
    
    
    
    
    
    
}


- (IBAction)clearcontrol:(id)sender {
    
    [mapView_ clear];
    
    distancesph =0;
    
    pointArray = [[NSMutableArray alloc] init];
    bearingArray = [[NSMutableArray alloc] init];
    widthArray = [[NSMutableArray alloc] init];
    
}


- (IBAction)lightbarbuttoncontrol:(id)sender {
    
    [self.myTextField resignFirstResponder];
    
    GMSCameraPosition *currentLocation = [GMSCameraPosition cameraWithLatitude:locationManager.location.coordinate.latitude
                                                            longitude:locationManager.location.coordinate.longitude
                                                                 zoom:14];
    [mapView_ setCamera:currentLocation];
    
    
    lightbar = YES;
    
    
    noarrows = [UIImage imageNamed:@"lightbar"];
    [arrowView setImage:noarrows];
    
    
    NSString *message = @"Long Press to Drag Markers to center or corner of field. Then Press Start.";
    
    UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:nil, nil];
    [toast show];
    
    int duration = 3; // duration in seconds
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [toast dismissWithClickedButtonIndex:0 animated:YES];
    });

    
    
    
    
    CLLocationCoordinate2D position1 = CLLocationCoordinate2DMake(locationManager.location.coordinate.latitude, locationManager.location.coordinate.longitude);
    marker = [GMSMarker markerWithPosition:position1];
    marker.title = @"A";
    marker.draggable  = YES;
    marker.map = mapView_;
    
    CLLocationCoordinate2D position2 = CLLocationCoordinate2DMake(locationManager.location.coordinate.latitude + 0.005, locationManager.location.coordinate.longitude);
    marker2 = [GMSMarker markerWithPosition:position2];
    marker2.draggable = YES;
    marker2.map = mapView_;
    
    
   
    
    
    
    
}




- (void) mapView:mapView_ didEndDraggingMarker:null
{
    
    banana = self.myTextField.text;
    if ([banana  isEqual: @""])
    { }
    else{
    
            double stringDouble = [banana doubleValue];
    
    //fix this
        
     //   GMSMarker *marker;
        
      //  GMSMarker *marker2;
       
        
        positionofmarkerA = marker.position;
    
        
        
        
        positionofmarkerB = marker2.position;
        
        
    
        
    }
    
}


-(void)heightEngine {
    
    CLLocationCoordinate2D currentLocation = CLLocationCoordinate2DMake(locationManager.location.coordinate.latitude, locationManager.location.coordinate.longitude);
    
    distanceABline =   GMSGeometryDistance(positionofmarkerA, positionofmarkerB);
    distanceACline =    GMSGeometryDistance(positionofmarkerA, currentLocation);
    distanceBCline =     GMSGeometryDistance(positionofmarkerB, currentLocation);
    
    double aCo =  (pow(distanceACline, 2.0) + pow(distanceABline, 2.0) - pow(distanceBCline, 2.0)) / (2.0 * distanceACline * distanceABline);
    
    
    double angleA = acos(aCo) ;
    
    height =  3.28084 * distanceACline * sin(angleA ) ;
    
   
    
    
    
    // Use herons fomula to calculate area
    //Use the area to solve for the height of the triangle
    // semiperimeter for herons formula is defined as (LengthOfSideA + LengthofSideB + LengthOfSideC)/2
    
    double semiperimeter = (distanceABline + distanceACline + distanceBCline)/2;
    
   // height = 3.28084 * ( ((2 * sqrt(semiperimeter * (semiperimeter - distanceABline) * (semiperimeter - distanceACline) * (semiperimeter - distanceBCline))) / distanceABline) ) ;
    
    
   
    NSString *message = [NSString stringWithFormat:@" course %.2f", height];
    
    double  ac = GMSGeometryHeading(positionofmarkerA, currentLocation);
    
    //convert to degrees positive 0 to 360
    if (ac < 0) { ac = 180 + (180 + ac); }
    
    double ba = GMSGeometryHeading(positionofmarkerB, positionofmarkerA);
    
    double  ab = GMSGeometryHeading(positionofmarkerA, positionofmarkerB);
    
    
    
    //convert to degrees positive 0 to 360
    if (ba < 0) { ba = 180 + (180 + ba);}
    
    //convert to degrees positive 0 to 360
    if (ab < 0){ab = 180 + (180 + ab);}
    
    
    if (ac <= 180 + ba) {heightMagnitude = YES;} else {
        heightMagnitude = NO; }
    
    double  bearing = locationManager.location.course;
    
    //Map flipper will be set to true if current bearing is opposite the set AB line
    
    double d7 = bearing - ba;
    if (d7 < 0){d7 = -d7;}
    if (d7 > 160 && d7 < 200)
    {
        mapFlipper = YES;
    }
    //else{mapFlipper = NO;}
    
    double    d8 = bearing - ab;
    if (d8 < 0){d8 = -d8;}
    if (d8 > 160 && d8 < 200){mapFlipper = NO;}
    //else{mapFlipper = YES;}

    
    
    
    
    
}


- (IBAction)heightDisplay:(id)sender {
    
    
    
    
}




-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self->mapView_.frame = self.view.bounds;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"You entered %@",self.myTextField.text);
    // banana = self.myTextField.text;
    [self.myTextField resignFirstResponder];
    
    
    return YES;
}

-(void)CurrentLocationIdentifier
{
    //---- For getting current gps location
    locationManager = [CLLocationManager new];
    locationManager.delegate = self;
    
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [locationManager requestAlwaysAuthorization];
    }
    
    
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    
    [locationManager startUpdatingLocation];
    
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.33 target:self selector:@selector(updateLocation) userInfo:nil repeats:YES];
    
    NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(fasterUpdateLocation) userInfo:nil repeats:YES];
    
    
}

- (void)fasterUpdateLocation {
    
    //DRAW LINE IN FRONT
    
    headingIndicator.map = nil;
    
    CLLocationCoordinate2D startPoint = CLLocationCoordinate2DMake(locationManager.location.coordinate.latitude, locationManager.location.coordinate.longitude);
    
    double currentBearing = locationManager.location.course;
    
    CLLocationCoordinate2D aheadPoint = GMSGeometryOffset(startPoint, 200 ,currentBearing);
    
    GMSMutablePath *linepath = [GMSMutablePath path];
    [linepath addCoordinate:startPoint];
    [linepath addCoordinate:aheadPoint];
    
    
    
    headingIndicator = [GMSPolyline polylineWithPath:linepath];
    headingIndicator.strokeColor = [UIColor colorWithRed:0.50 green:0.5 blue:0.25 alpha:1];
    headingIndicator.strokeWidth = 3;
    headingIndicator.map = mapView_;
    
    if(lightbar == YES){
        
        [self heightEngine];
        
        [self boomIntervalTest];
        
        [self arrowControl];
        
        
       // _widthIntervalView.text = [NSString stringWithFormat:@"%.2f", stringDoubleMultiplier];
        
      //  _heightView.text = [NSString stringWithFormat:@"%.2f", height];
        
        
    }

    
    
    
    
}


- (void)updateLocation {
    
    
    
    banana = self.myTextField.text;
    if ([banana  isEqual: @""])
    { }
    else{
        
        
        if(paused == true){}
        
        else{
            
            //DRAW LINE IN FRONT
            /*
            headingIndicator.map = nil;
            
            CLLocationCoordinate2D startPoint = CLLocationCoordinate2DMake(locationManager.location.coordinate.latitude, locationManager.location.coordinate.longitude);
            
            double currentBearing = locationManager.location.course;
            
            CLLocationCoordinate2D aheadPoint = GMSGeometryOffset(startPoint, 200 ,currentBearing);
            
            GMSMutablePath *linepath = [GMSMutablePath path];
            [linepath addCoordinate:startPoint];
            [linepath addCoordinate:aheadPoint];
            
            
            
           headingIndicator = [GMSPolyline polylineWithPath:linepath];
            headingIndicator.strokeColor = [UIColor colorWithRed:0.50 green:0.5 blue:0.25 alpha:1];
            headingIndicator.strokeWidth = 3;
            headingIndicator.map = mapView_;
            
            */
            
    //careful Nested if statements. The BOOL flip encompasses the entire camera control
            
            if(flip == YES){
            
            if(mapFlipper == NO){
            
            double ba = GMSGeometryHeading(positionofmarkerB, positionofmarkerA);
            
            GMSCameraPosition *currentLocation = [GMSCameraPosition cameraWithLatitude:locationManager.location.coordinate.latitude
                                                                             longitude:locationManager.location.coordinate.longitude
                                                                                  zoom:20
                                                                               bearing:ba
                                                                          viewingAngle:45
                                                  
                                                  ];
            [mapView_ setCamera:currentLocation];
            

            }
            
            else {
                
                double ab = GMSGeometryHeading(positionofmarkerA, positionofmarkerB);
                
                GMSCameraPosition *currentLocation = [GMSCameraPosition cameraWithLatitude:locationManager.location.coordinate.latitude
                                                                                 longitude:locationManager.location.coordinate.longitude
                                                                                      zoom:20
                                                                                   bearing:ab
                                                                              viewingAngle:45
                                                      
                                                      ];
                [mapView_ setCamera:currentLocation];
                
                
            }
            }
            
            else{}
            
            
            
            
            
            double stringDouble = [banana doubleValue];
            
            /* GMSCameraPosition *sydney = [GMSCameraPosition cameraWithLatitude:locationManager.location.coordinate.latitude
             longitude:locationManager.location.coordinate.longitude
             zoom:6];
             [mapView_ setCamera:sydney];
            
            CLLocationCoordinate2D circleCenter = CLLocationCoordinate2DMake(locationManager.location.coordinate.latitude, locationManager.location.coordinate.longitude);
            GMSCircle *circ = [GMSCircle circleWithPosition:circleCenter
                                                     radius:stringDouble];
            circ.fillColor = [UIColor colorWithRed:0.50 green:0 blue:0 alpha:0.20];
            circ.map = mapView_;
            */
            
            
            /*
            if(lightbar == YES){
            
            [self heightEngine];
            
            [self boomIntervalTest];
            
            [self arrowControl];
                
             
                
                
            
            }
            */
            
            currentPosition = CLLocationCoordinate2DMake(locationManager.location.coordinate.latitude, locationManager.location.coordinate.longitude);
            
            
            if(CLLocationCoordinate2DIsValid(lastPosition)) {
                
                
                
                [self ArPoints];
                [self displayInfo];
                
            }
            
            
                
            
                
            
            
            lastPosition = currentPosition;
            
            
            
        }
        
        
    }
    
    // do all the work here
}




//increment counter. draw current polygon. save points to array--every fourth. clear map and call ArPointsFactory() to redraw with less polygons
-(void)ArPoints {
    
    pointNum++;
    
    //Calculate polygon corner locations
    
    banana = self.myTextField.text;
    double stringDouble;
    double inFeet;
    
    if ([banana  isEqual: @""])
    { }
    else{
        
        stringDouble  = [banana doubleValue];
        
        //not actually in feet, but when you plug it into the metric socket it shows up as feet
         inFeet = stringDouble/3.28084;
    
    
    course = locationManager.location.course;
        
       
        
        
    
    CLLocationCoordinate2D locationCoordinate1 = GMSGeometryOffset(lastPosition, inFeet/2, 90 + course);
    CLLocationCoordinate2D locationCoordinate2 = GMSGeometryOffset(lastPosition, inFeet/2,  course - 90);
    CLLocationCoordinate2D locationCoordinate3 = GMSGeometryOffset(currentPosition, inFeet/2,  course - 90);
    CLLocationCoordinate2D locationCoordinate4 = GMSGeometryOffset(currentPosition, inFeet/2,  course + 90);
     
            /*
            //ok this works, but my offset does not
     CLLocationCoordinate2D locationCoordinate1 = CLLocationCoordinate2DMake(locationManager.location.coordinate.latitude, locationManager.location.coordinate.longitude );
            
            CLLocationCoordinate2D locationCoordinate2 = CLLocationCoordinate2DMake(37.45, -122.0 );
            
            CLLocationCoordinate2D locationCoordinate3 = CLLocationCoordinate2DMake(37.45, -122.2);
            
            CLLocationCoordinate2D locationCoordinate4 = CLLocationCoordinate2DMake(37.36, -122.2);
        */
        
    GMSMutablePath *rect = [GMSMutablePath path];
            
            [rect addCoordinate:locationCoordinate1];
            [rect addCoordinate:locationCoordinate2];
            [rect addCoordinate:locationCoordinate3];
            [rect addCoordinate:locationCoordinate4];
            
   
    
    // Create the polygon, and assign it to the map.
    GMSPolygon *polygon = [GMSPolygon polygonWithPath:rect];
    polygon.fillColor = [UIColor colorWithRed:0.50 green:0.20 blue:0 alpha:0.50];
    polygon.strokeColor = [UIColor colorWithRed:0.50 green:0 blue:0 alpha:0.50];
    polygon.strokeWidth = 1;
    polygon.map = mapView_;
            
            
      
    
       
      
        
    // store items in array every fourth instance to minimize number of polygons on map
        
        
        if(pointNum % 10 == 0) {
            
            //PUT MAP CLEAR FUNCTION HERE
            
            [mapView_ clear];
            
            // REDRAW LINES BECAUSE THEY WERE ERASED PRIOR TO THIS METHOD BEING CALLED
            
            if(lightbar == YES){
            
            [self lineDraw];
                
            }
        
        CLLocation *pointLocation = [[CLLocation alloc] initWithLatitude:currentPosition.latitude longitude:currentPosition.longitude];
        CLLocation *courseLocation = [[CLLocation alloc] initWithCoordinate:currentPosition altitude:locationManager.location.altitude horizontalAccuracy:locationManager.location.horizontalAccuracy verticalAccuracy:locationManager.location.verticalAccuracy course:course speed:locationManager.location.speed timestamp:locationManager.location.timestamp];
        
        [pointArray addObject:pointLocation];
        [bearingArray addObject:courseLocation];
        NSNumber *num = [NSNumber numberWithDouble:inFeet];
        [widthArray addObject:num];
            
            [self ArPointsFactory];
        
        } // close of pointNum
        
    }
}


//cycle through array and draw polygons with the points.
-(void)ArPointsFactory {
    
    
    banana = self.myTextField.text;
    double stringDouble;
    double inFeet;
   
    if ([banana  isEqual: @""])
    { }
    else{
        
        stringDouble  = [banana doubleValue];
        
        //not actually in feet, but when you plug it into the metric socket it shows up as feet
        inFeet = stringDouble/3.28084;
    
    
    
    
           

    
     last = kCLLocationCoordinate2DInvalid;
        
    NSUInteger arrayLength = [bearingArray count];
    
    // loop through array to get course and location values
    //LOOP             LOOP              LOOP         LOOP
    for (NSUInteger i = 0; i < arrayLength; i++) {
        
        //get values from array
        
        CLLocation *locObj = [bearingArray objectAtIndex:i];
        
        
        CLLocationCoordinate2D current = locObj.coordinate;
        
        double storedCourse = locObj.course;
        
        
        
        
        
        //draw polygons from values
        if(CLLocationCoordinate2DIsValid(last)) {
        CLLocationCoordinate2D locationCoordinate1 = GMSGeometryOffset(last, inFeet/2, 90 + storedCourse);
        CLLocationCoordinate2D locationCoordinate2 = GMSGeometryOffset(last, inFeet/2,  storedCourse - 90);
        CLLocationCoordinate2D locationCoordinate3 = GMSGeometryOffset(current, inFeet/2,  storedCourse - 90);
        CLLocationCoordinate2D locationCoordinate4 = GMSGeometryOffset(current, inFeet/2,  storedCourse + 90);
        
        
        GMSMutablePath *rect = [GMSMutablePath path];
        [rect addCoordinate:locationCoordinate1	];
        [rect addCoordinate:locationCoordinate2];
        [rect addCoordinate:locationCoordinate3];
        [rect addCoordinate:locationCoordinate4];
        
        // Create the polygon, and assign it to the map.
        GMSPolygon *polygon = [GMSPolygon polygonWithPath:rect];
        polygon.fillColor = [UIColor colorWithRed:0.25 green:0 blue:0 alpha:0.25];
        polygon.strokeColor = [UIColor colorWithRed:0.25 green:0 blue:0 alpha:0.25];
        polygon.strokeWidth = 1;
        polygon.map = mapView_;
          
         last = current;
        }
        else {last = current; }
        
        
        
    }
    
    // END OF LOOP LOOP           LOOP             LOOP           LOOP
    
    
    
 }
}

-(void) displayInfo {
    
    //show speed and acres
    
    
     banana = self.myTextField.text;
    
     speed = locationManager.location.speed * 2.23694; //converted to mph
    
    NSString *speedString = @"";
    NSString *acreString = @"";
    
    
    if(speed >=0 ) speedString = [NSString stringWithFormat:@"%.2f", speed];
    
    
    _speedview.text = speedString;
    
   currentac = kCLLocationCoordinate2DInvalid;
    
    
    if(locationManager.location.horizontalAccuracy < 15) {
    
     currentac = CLLocationCoordinate2DMake(locationManager.location.coordinate.latitude, locationManager.location.coordinate.longitude );
    }
    
    
    if (paused == false && CLLocationCoordinate2DIsValid(previousac)){
        distancesph +=  GMSGeometryDistance(previousac, currentac);
    }
    
    previousac = kCLLocationCoordinate2DInvalid;






double stringDouble  = [banana doubleValue];

//not actually in feet, but when you plug it into the metric socket it shows up as feet
    double inFeet = stringDouble;


double distancetraveledconversion = distancesph * 3.28084; //to feet

double acres = distancetraveledconversion * inFeet/43560;
    
    if(acres < 200) {

    acreString =  [NSString stringWithFormat:@"%.2f", acres];

    _acreview.text = acreString;
    
        previousac = currentac;}
    
    else {_acreview.text = @"ERROR";
    distancesph =0;
    }
    
    
}



- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//resume button
- (IBAction)rbuttoncontrol:(id)sender {
    
    paused = false;
    
    NSString *pausedmessage;
    if(paused ==false){
        pausedmessage = @"RESUMED"; }
    
    
    
    UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                    message:pausedmessage
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:nil, nil];
    [toast show];
    
    int duration = 1; // duration in seconds
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [toast dismissWithClickedButtonIndex:0 animated:YES];
    });
    
    
    
    
    
}


//pause button
- (IBAction)buttoncontrol:(id)sender {
    
    // [self.button setTitle: @"BEANS" forState:UIControlStateNormal];
    
    
    
    paused = true;
    NSString *pausedmessage;
    if(paused ==true){
        pausedmessage = @"PAUSED"; }
    
    
    
    UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                    message:pausedmessage
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:nil, nil];
    [toast show];
    
    int duration = 1; // duration in seconds
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [toast dismissWithClickedButtonIndex:0 animated:YES];
    });
    
    
    
    
    
    
}









//start button
- (IBAction)clickycontrol:(id)sender {
    
    [self.myTextField resignFirstResponder];
    
    banana = self.myTextField.text;
    
    // CONVERT TEXT TO BOOM WIDTH double
    
     stringDouble = [banana doubleValue];
    
    
    
    // SETS THE CAMERA TO CURRENT LOCATION
    
    double ba = GMSGeometryHeading(positionofmarkerA, positionofmarkerB);
    
    GMSCameraPosition *currentLocation = [GMSCameraPosition cameraWithLatitude:locationManager.location.coordinate.latitude
                                                            longitude:locationManager.location.coordinate.longitude
                                                                 zoom:18
                                                                       bearing:ba
                                                                    viewingAngle:45
                                          
                                          ];
    [mapView_ setCamera:currentLocation];
    
    
    
    
    
    
    
    
    // if nothing in text box tell user to enter boom width
    
    if ([banana  isEqual: @""])
    {
        //display message to enter width of boom or equipment
        
        NSString *message = @"ENTER BOOM WIDTH";
        
        
        
        UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:nil, nil];
        [toast show];
        
        int duration = 1; // duration in seconds
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [toast dismissWithClickedButtonIndex:0 animated:YES];
        });
        
    }
    
    //ASSUMING GOOD NUMBER DRAWING BEGINS
    else{
        
        
        
        if(lightbar == YES){
        
        
        [self lineDraw];
        
        }
        
        
        paused = false;
    }
    
    
    
}

-(void)lineDraw{
    
    double inFeet;
    
    inFeet = stringDouble/3.28084;
    
    GMSMutablePath *pathfromPointtoPoint = [GMSMutablePath path];
    [pathfromPointtoPoint addCoordinate:positionofmarkerA];
    [pathfromPointtoPoint addCoordinate:positionofmarkerB];
    
    GMSPolyline *pointtopoint = [GMSPolyline polylineWithPath:pathfromPointtoPoint];
    pointtopoint.map = mapView_;
    
    double ABHeading = GMSGeometryHeading(positionofmarkerA, positionofmarkerB);
    
    CLLocationCoordinate2D markerAposition = GMSGeometryOffset(positionofmarkerA, inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerAAposition = GMSGeometryOffset(positionofmarkerB, inFeet, ABHeading + 90);
    
    GMSMutablePath *pathA = [GMSMutablePath path];
    [pathA addCoordinate:markerAposition];
    [pathA addCoordinate:markerAAposition];
    
    
    GMSPolyline *centerlineA = [GMSPolyline polylineWithPath:pathA];
    centerlineA.map = mapView_;
    
    // c - cc
    
    CLLocationCoordinate2D markerCposition = GMSGeometryOffset(positionofmarkerA, 2 * inFeet, ABHeading +90);
    
    CLLocationCoordinate2D markerCCposition = GMSGeometryOffset(positionofmarkerB, 2* inFeet, ABHeading + 90);
    
    GMSMutablePath *pathC = [GMSMutablePath path];
    [pathC addCoordinate:markerCposition];
    [pathC addCoordinate:markerCCposition];
    
    
    GMSPolyline *centerlineC = [GMSPolyline polylineWithPath:pathC];
    centerlineC.map = mapView_;
    
    // d -dd
    
    CLLocationCoordinate2D markerDposition = GMSGeometryOffset(positionofmarkerA, 3 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerDDposition = GMSGeometryOffset(positionofmarkerB, 3 * inFeet, ABHeading + 90);
    
    GMSMutablePath *pathD = [GMSMutablePath path];
    [pathD addCoordinate:markerDposition];
    [pathD addCoordinate:markerDDposition];
    
    
    GMSPolyline *centerlineD = [GMSPolyline polylineWithPath:pathD];
    centerlineD.map = mapView_;
    
    // e -ee
    
    CLLocationCoordinate2D markerEposition = GMSGeometryOffset(positionofmarkerA, 4 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerEEposition = GMSGeometryOffset(positionofmarkerB, 4 * inFeet, ABHeading + 90);
    
    GMSMutablePath *pathE = [GMSMutablePath path];
    [pathE addCoordinate:markerEposition];
    [pathE addCoordinate:markerEEposition];
    
    
    GMSPolyline *centerlineE = [GMSPolyline polylineWithPath:pathE];
    centerlineE.map = mapView_;
    
    
    // f -ff
    
    CLLocationCoordinate2D markerFposition = GMSGeometryOffset(positionofmarkerA, 5 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerFFposition = GMSGeometryOffset(positionofmarkerB, 5 * inFeet, ABHeading + 90);
    
    GMSMutablePath *pathF = [GMSMutablePath path];
    [pathF addCoordinate:markerFposition];
    [pathF addCoordinate:markerFFposition];
    
    
    GMSPolyline *centerlineF = [GMSPolyline polylineWithPath:pathF];
    centerlineF.map = mapView_;
    
    // g -gg
    
    CLLocationCoordinate2D markerGposition = GMSGeometryOffset(positionofmarkerA, 6* inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerGGposition = GMSGeometryOffset(positionofmarkerB, 6* inFeet, ABHeading + 90);
    
    GMSMutablePath *pathG = [GMSMutablePath path];
    [pathG addCoordinate:markerGposition];
    [pathG addCoordinate:markerGGposition];
    
    
    GMSPolyline *centerlineG = [GMSPolyline polylineWithPath:pathG];
    centerlineG.map = mapView_;
    
    // h -hh
    
    CLLocationCoordinate2D markerHposition = GMSGeometryOffset(positionofmarkerA, 7 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerHHposition = GMSGeometryOffset(positionofmarkerB, 7 * inFeet, ABHeading + 90);
    
    GMSMutablePath *pathH = [GMSMutablePath path];
    [pathH addCoordinate:markerHposition];
    [pathH addCoordinate:markerHHposition];
    
    
    GMSPolyline *centerlineH = [GMSPolyline polylineWithPath:pathH];
    centerlineH.map = mapView_;
    
    
    // i -ii
    
    CLLocationCoordinate2D markerIposition = GMSGeometryOffset(positionofmarkerA, 8 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerIIposition = GMSGeometryOffset(positionofmarkerB, 8 * inFeet, ABHeading + 90);
    
    GMSMutablePath *pathI = [GMSMutablePath path];
    [pathI addCoordinate:markerIposition];
    [pathI addCoordinate:markerIIposition];
    
    
    GMSPolyline *centerlineI = [GMSPolyline polylineWithPath:pathI];
    centerlineI.map = mapView_;
    
    // j -jj
    
    CLLocationCoordinate2D markerJposition = GMSGeometryOffset(positionofmarkerA, 9 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerJJposition = GMSGeometryOffset(positionofmarkerB, 9 * inFeet, ABHeading + 90);
    
    GMSMutablePath *pathJ = [GMSMutablePath path];
    [pathJ addCoordinate:markerJposition];
    [pathJ addCoordinate:markerJJposition];
    
    
    GMSPolyline *centerlineJ = [GMSPolyline polylineWithPath:pathJ];
    centerlineJ.map = mapView_;
    
    
    
    // k -kk
    
    CLLocationCoordinate2D markerKposition = GMSGeometryOffset(positionofmarkerA, 10 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerKKposition = GMSGeometryOffset(positionofmarkerB, 10 * inFeet, ABHeading + 90);
    
    GMSMutablePath *pathK = [GMSMutablePath path];
    [pathK addCoordinate:markerKposition];
    [pathK addCoordinate:markerKKposition];
    
    
    GMSPolyline *centerlineK = [GMSPolyline polylineWithPath:pathK];
    centerlineK.map = mapView_;
    
    
    // l - ll
    
    CLLocationCoordinate2D markerLposition = GMSGeometryOffset(positionofmarkerA, 11 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerLLposition = GMSGeometryOffset(positionofmarkerB, 11* inFeet, ABHeading + 90);
    
    GMSMutablePath *pathL = [GMSMutablePath path];
    [pathL addCoordinate:markerLposition];
    [pathL addCoordinate:markerLLposition];
    
    
    GMSPolyline *centerlineL = [GMSPolyline polylineWithPath:pathL];
    centerlineL.map = mapView_;
    
    
    // m - mm
    
    CLLocationCoordinate2D markerMposition = GMSGeometryOffset(positionofmarkerA, 12 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerMMposition = GMSGeometryOffset(positionofmarkerB, 12 * inFeet, ABHeading + 90);
    
    GMSMutablePath *pathM = [GMSMutablePath path];
    [pathM addCoordinate:markerMposition];
    [pathM addCoordinate:markerMMposition];
    
    
    GMSPolyline *centerlineM = [GMSPolyline polylineWithPath:pathM];
    centerlineM.map = mapView_;
    
    // n - nn
    
    CLLocationCoordinate2D markerNposition = GMSGeometryOffset(positionofmarkerA, 13 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerNNposition = GMSGeometryOffset(positionofmarkerB, 13 * inFeet, ABHeading + 90);
    
    GMSMutablePath *pathN = [GMSMutablePath path];
    [pathN addCoordinate:markerNposition];
    [pathN addCoordinate:markerNNposition];
    
    
    GMSPolyline *centerlineN = [GMSPolyline polylineWithPath:pathN];
    centerlineN.map = mapView_;
    
    
    // o -oo
    
    CLLocationCoordinate2D markerOposition = GMSGeometryOffset(positionofmarkerA, 14 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerOOposition = GMSGeometryOffset(positionofmarkerB, 14 * inFeet, ABHeading + 90);
    
    GMSMutablePath *pathO = [GMSMutablePath path];
    [pathO addCoordinate:markerOposition];
    [pathO addCoordinate:markerOOposition];
    
    
    GMSPolyline *centerlineO = [GMSPolyline polylineWithPath:pathO];
    centerlineO.map = mapView_;
    
    // p -pp
    
    CLLocationCoordinate2D markerPposition = GMSGeometryOffset(positionofmarkerA, 15 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerPPposition = GMSGeometryOffset(positionofmarkerB, 15 * inFeet, ABHeading + 90);
    
    GMSMutablePath *pathP = [GMSMutablePath path];
    [pathP addCoordinate:markerPposition];
    [pathP addCoordinate:markerPPposition];
    
    
    GMSPolyline *centerlineP = [GMSPolyline polylineWithPath:pathP];
    centerlineP.map = mapView_;
    
    // q -qq
    
    CLLocationCoordinate2D markerQposition = GMSGeometryOffset(positionofmarkerA, 16 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerQQposition = GMSGeometryOffset(positionofmarkerB, 16 * inFeet, ABHeading + 90);
    
    GMSMutablePath *pathQ = [GMSMutablePath path];
    [pathQ addCoordinate:markerQposition];
    [pathQ addCoordinate:markerQQposition];
    
    
    GMSPolyline *centerlineQ = [GMSPolyline polylineWithPath:pathQ];
    centerlineQ.map = mapView_;
    
    //r -rr
    
    CLLocationCoordinate2D markerRposition = GMSGeometryOffset(positionofmarkerA, 17 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerRRposition = GMSGeometryOffset(positionofmarkerB, 17 * inFeet, ABHeading + 90);
    
    GMSMutablePath *pathR = [GMSMutablePath path];
    [pathR addCoordinate:markerRposition];
    [pathR addCoordinate:markerRRposition];
    
    
    GMSPolyline *centerlineR = [GMSPolyline polylineWithPath:pathR];
    centerlineR.map = mapView_;
    
    
    //s -ss
    
    CLLocationCoordinate2D markerSposition = GMSGeometryOffset(positionofmarkerA, 18 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerSSposition = GMSGeometryOffset(positionofmarkerB, 18 * inFeet, ABHeading + 90);
    
    GMSMutablePath *pathS = [GMSMutablePath path];
    [pathS addCoordinate:markerSposition];
    [pathS addCoordinate:markerSSposition];
    
    
    GMSPolyline *centerlineS = [GMSPolyline polylineWithPath:pathS];
    centerlineS.map = mapView_;
    
    //t -tt
    
    CLLocationCoordinate2D markerTposition = GMSGeometryOffset(positionofmarkerA, 19 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerTTposition = GMSGeometryOffset(positionofmarkerB, 19 * inFeet, ABHeading + 90);
    
    GMSMutablePath *pathT = [GMSMutablePath path];
    [pathT addCoordinate:markerTposition];
    [pathT addCoordinate:markerTTposition];
    
    
    GMSPolyline *centerlineT = [GMSPolyline polylineWithPath:pathT];
    centerlineT.map = mapView_;
    
    //u -uu
    
    CLLocationCoordinate2D markerUposition = GMSGeometryOffset(positionofmarkerA, 20 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerUUposition = GMSGeometryOffset(positionofmarkerB, 20 * inFeet, ABHeading + 90);
    
    GMSMutablePath *pathU = [GMSMutablePath path];
    [pathU addCoordinate:markerUposition];
    [pathU addCoordinate:markerUUposition];
    
    
    GMSPolyline *centerlineU = [GMSPolyline polylineWithPath:pathU];
    centerlineU.map = mapView_;
    
    //v -vv
    
    CLLocationCoordinate2D markerVposition = GMSGeometryOffset(positionofmarkerA, 21 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerVVposition = GMSGeometryOffset(positionofmarkerB, 21 * inFeet, ABHeading + 90);
    
    GMSMutablePath *pathV = [GMSMutablePath path];
    [pathV addCoordinate:markerVposition];
    [pathV addCoordinate:markerVVposition];
    
    
    GMSPolyline *centerlineV = [GMSPolyline polylineWithPath:pathV];
    centerlineV.map = mapView_;
    
    //w -ww
    
    CLLocationCoordinate2D markerWposition = GMSGeometryOffset(positionofmarkerA, 22 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerWWposition = GMSGeometryOffset(positionofmarkerB, 22 * inFeet, ABHeading + 90);
    
    GMSMutablePath *pathW = [GMSMutablePath path];
    [pathW addCoordinate:markerWposition];
    [pathW addCoordinate:markerWWposition];
    
    
    GMSPolyline *centerlineW = [GMSPolyline polylineWithPath:pathW];
    centerlineW.map = mapView_;
    
    //x -xx
    
    CLLocationCoordinate2D markerXposition = GMSGeometryOffset(positionofmarkerA, 23 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerXXposition = GMSGeometryOffset(positionofmarkerB, 23 * inFeet, ABHeading + 90);
    
    GMSMutablePath *pathX = [GMSMutablePath path];
    [pathX addCoordinate:markerXposition];
    [pathX addCoordinate:markerXXposition];
    
    
    GMSPolyline *centerlineX = [GMSPolyline polylineWithPath:pathX];
    centerlineX.map = mapView_;
    
    
    
    
    
    // y -yy
    
    CLLocationCoordinate2D markerYposition = GMSGeometryOffset(positionofmarkerA, 24 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerYYposition = GMSGeometryOffset(positionofmarkerB, 24 * inFeet, ABHeading + 90);
    
    GMSMutablePath *pathY = [GMSMutablePath path];
    [pathY addCoordinate:markerYposition];
    [pathY addCoordinate:markerYYposition];
    
    
    GMSPolyline *centerlineY = [GMSPolyline polylineWithPath:pathY];
    centerlineY.map = mapView_;
    
    // z -zz
    
    CLLocationCoordinate2D markerZposition = GMSGeometryOffset(positionofmarkerA, 25 * inFeet, ABHeading + 90);
    
    CLLocationCoordinate2D markerZZposition = GMSGeometryOffset(positionofmarkerB, 25 * inFeet, ABHeading + 90);
    
    GMSMutablePath *pathZ = [GMSMutablePath path];
    [pathZ addCoordinate:markerZposition];
    [pathZ addCoordinate:markerZZposition];
    
    
    GMSPolyline *centerlineZ = [GMSPolyline polylineWithPath:pathZ];
    centerlineZ.map = mapView_;
    
    //left side
    
    // 1 -11
    
    CLLocationCoordinate2D marker1position = GMSGeometryOffset(positionofmarkerA,  inFeet, ABHeading - 90);
    
    CLLocationCoordinate2D marker11position = GMSGeometryOffset(positionofmarkerB,  inFeet,ABHeading-90);
    
    GMSMutablePath *path1 = [GMSMutablePath path];
    [path1 addCoordinate:marker1position];
    [path1 addCoordinate:marker11position];
    
    
    GMSPolyline *centerline1 = [GMSPolyline polylineWithPath:path1];
    centerline1.map = mapView_;
    
    //2 -22
    
    CLLocationCoordinate2D marker2position = GMSGeometryOffset(positionofmarkerA,  2 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D marker22position = GMSGeometryOffset(positionofmarkerB, 2 * inFeet, ABHeading -90);
    
    GMSMutablePath *path2 = [GMSMutablePath path];
    [path2 addCoordinate:marker2position];
    [path2 addCoordinate:marker22position];
    
    
    GMSPolyline *centerline2 = [GMSPolyline polylineWithPath:path2];
    centerline2.map = mapView_;
    
    //3 -33
    
    CLLocationCoordinate2D marker3position = GMSGeometryOffset(positionofmarkerA,  3 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D marker33position = GMSGeometryOffset(positionofmarkerB, 3 * inFeet, ABHeading -90);
    
    GMSMutablePath *path3 = [GMSMutablePath path];
    [path3 addCoordinate:marker3position];
    [path3 addCoordinate:marker33position];
    
    
    GMSPolyline *centerline3 = [GMSPolyline polylineWithPath:path3];
    centerline3.map = mapView_;
    
    //4 -44
    
    CLLocationCoordinate2D marker4position = GMSGeometryOffset(positionofmarkerA,  4 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D marker44position = GMSGeometryOffset(positionofmarkerB,  4 * inFeet, ABHeading -90);
    
    GMSMutablePath *path4 = [GMSMutablePath path];
    [path4 addCoordinate:marker4position];
    [path4 addCoordinate:marker44position];
    
    
    GMSPolyline *centerline4 = [GMSPolyline polylineWithPath:path4];
    centerline4.map = mapView_;
    
    //5 -55
    
    CLLocationCoordinate2D marker5position = GMSGeometryOffset(positionofmarkerA,  5 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D marker55position = GMSGeometryOffset(positionofmarkerB,  5 * inFeet, ABHeading -90);
    
    GMSMutablePath *path5 = [GMSMutablePath path];
    [path5 addCoordinate:marker5position];
    [path5 addCoordinate:marker55position];
    
    
    GMSPolyline *centerline5 = [GMSPolyline polylineWithPath:path5];
    centerline5.map = mapView_;
    
    
    //6 -66
    
    CLLocationCoordinate2D marker6position = GMSGeometryOffset(positionofmarkerA,  6 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D marker66position = GMSGeometryOffset(positionofmarkerB,  6 * inFeet, ABHeading -90);
    
    GMSMutablePath *path6 = [GMSMutablePath path];
    [path6 addCoordinate:marker6position];
    [path6 addCoordinate:marker66position];
    
    
    GMSPolyline *centerline6 = [GMSPolyline polylineWithPath:path6];
    centerline6.map = mapView_;
    
    //7 -77
    
    CLLocationCoordinate2D marker7position = GMSGeometryOffset(positionofmarkerA,  7 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D marker77position = GMSGeometryOffset(positionofmarkerB,  7 * inFeet, ABHeading -90);
    
    GMSMutablePath *path7 = [GMSMutablePath path];
    [path7 addCoordinate:marker7position];
    [path7 addCoordinate:marker77position];
    
    
    GMSPolyline *centerline7 = [GMSPolyline polylineWithPath:path7];
    centerline7.map = mapView_;
    
    //8 - 88
    
    CLLocationCoordinate2D marker8position = GMSGeometryOffset(positionofmarkerA,  8 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D marker88position = GMSGeometryOffset(positionofmarkerB,  8 * inFeet, ABHeading -90);
    
    GMSMutablePath *path8 = [GMSMutablePath path];
    [path8 addCoordinate:marker8position];
    [path8 addCoordinate:marker88position];
    
    
    GMSPolyline *centerline8 = [GMSPolyline polylineWithPath:path8];
    centerline8.map = mapView_;
    
    //9 -99
    
    CLLocationCoordinate2D marker9position = GMSGeometryOffset(positionofmarkerA,  9 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D marker99position = GMSGeometryOffset(positionofmarkerB,  9 * inFeet, ABHeading -90);
    
    GMSMutablePath *path9 = [GMSMutablePath path];
    [path9 addCoordinate:marker9position];
    [path9 addCoordinate:marker99position];
    
    
    GMSPolyline *centerline9 = [GMSPolyline polylineWithPath:path9];
    centerline9.map = mapView_;
    
    //10 - 1010
    
    CLLocationCoordinate2D marker10position = GMSGeometryOffset(positionofmarkerA,  10 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D marker1010position = GMSGeometryOffset(positionofmarkerB, 10 *  inFeet, ABHeading -90);
    
    GMSMutablePath *path10 = [GMSMutablePath path];
    [path10 addCoordinate:marker10position];
    [path10 addCoordinate:marker1010position];
    
    
    GMSPolyline *centerline10 = [GMSPolyline polylineWithPath:path10];
    centerline10.map = mapView_;
    
    //11 -1111
    
    CLLocationCoordinate2D Marker11position = GMSGeometryOffset(positionofmarkerA,  11 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D Marker1111position = GMSGeometryOffset(positionofmarkerB,  11 * inFeet, ABHeading -90);
    
    GMSMutablePath *path11 = [GMSMutablePath path];
    [path11 addCoordinate:Marker11position];
    [path11 addCoordinate:Marker1111position];
    
    
    GMSPolyline *centerline11 = [GMSPolyline polylineWithPath:path11];
    centerline11.map = mapView_;
    
    //12 -1212
    CLLocationCoordinate2D Marker12position = GMSGeometryOffset(positionofmarkerA,  12 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D Marker1212position = GMSGeometryOffset(positionofmarkerB,  12 * inFeet, ABHeading -90);
    
    GMSMutablePath *path12 = [GMSMutablePath path];
    [path12 addCoordinate:Marker12position];
    [path12 addCoordinate:Marker1212position];
    
    
    GMSPolyline *centerline12 = [GMSPolyline polylineWithPath:path12];
    centerline12.map = mapView_;
    
    //13 -1313
    
    CLLocationCoordinate2D Marker13position = GMSGeometryOffset(positionofmarkerA,  13 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D Marker1313position = GMSGeometryOffset(positionofmarkerB,  13 * inFeet, ABHeading -90);
    
    GMSMutablePath *path13 = [GMSMutablePath path];
    [path13 addCoordinate:Marker13position];
    [path13 addCoordinate:Marker1313position];
    
    
    GMSPolyline *centerline13 = [GMSPolyline polylineWithPath:path13];
    centerline13.map = mapView_;
    
    //14 -1414
    
    CLLocationCoordinate2D Marker14position = GMSGeometryOffset(positionofmarkerA,  14 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D Marker1414position = GMSGeometryOffset(positionofmarkerB,  14 * inFeet, ABHeading -90);
    
    GMSMutablePath *path14 = [GMSMutablePath path];
    [path14 addCoordinate:Marker14position];
    [path14 addCoordinate:Marker1414position];
    
    
    GMSPolyline *centerline14 = [GMSPolyline polylineWithPath:path14];
    centerline14.map = mapView_;
    
    //15 -1515
    
    CLLocationCoordinate2D Marker15position = GMSGeometryOffset(positionofmarkerA,  15 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D Marker1515position = GMSGeometryOffset(positionofmarkerB,  15 * inFeet, ABHeading -90);
    
    GMSMutablePath *path15 = [GMSMutablePath path];
    [path15 addCoordinate:Marker15position];
    [path15 addCoordinate:Marker1515position];
    
    
    GMSPolyline *centerline15 = [GMSPolyline polylineWithPath:path15];
    centerline15.map = mapView_;
    
    //16 -1616
    
    CLLocationCoordinate2D Marker16position = GMSGeometryOffset(positionofmarkerA,  16 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D Marker1616position = GMSGeometryOffset(positionofmarkerB,  16 * inFeet, ABHeading -90);
    
    GMSMutablePath *path16 = [GMSMutablePath path];
    [path16 addCoordinate:Marker16position];
    [path16 addCoordinate:Marker1616position];
    
    
    GMSPolyline *centerline16 = [GMSPolyline polylineWithPath:path16];
    centerline16.map = mapView_;
    
    //17 -1717
    
    CLLocationCoordinate2D Marker17position = GMSGeometryOffset(positionofmarkerA,  17 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D Marker1717position = GMSGeometryOffset(positionofmarkerB,  17 * inFeet, ABHeading -90);
    
    GMSMutablePath *path17 = [GMSMutablePath path];
    [path17 addCoordinate:Marker17position];
    [path17 addCoordinate:Marker1717position];
    
    
    GMSPolyline *centerline17 = [GMSPolyline polylineWithPath:path17];
    centerline17.map = mapView_;
    
    //18 -1818
    
    CLLocationCoordinate2D Marker18position = GMSGeometryOffset(positionofmarkerA,  18 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D Marker1818position = GMSGeometryOffset(positionofmarkerB,  18 * inFeet, ABHeading -90);
    
    GMSMutablePath *path18 = [GMSMutablePath path];
    [path18 addCoordinate:Marker18position];
    [path18 addCoordinate:Marker1818position];
    
    
    GMSPolyline *centerline18 = [GMSPolyline polylineWithPath:path18];
    centerline18.map = mapView_;
    
    
    //19-19
    
    CLLocationCoordinate2D Marker19position = GMSGeometryOffset(positionofmarkerA,  19 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D Marker1919position = GMSGeometryOffset(positionofmarkerB,  19 * inFeet, ABHeading -90);
    
    GMSMutablePath *path19 = [GMSMutablePath path];
    [path19 addCoordinate:Marker19position];
    [path19 addCoordinate:Marker1919position];
    
    
    GMSPolyline *centerline19 = [GMSPolyline polylineWithPath:path19];
    centerline19.map = mapView_;
    
    //20 -2020
    
    CLLocationCoordinate2D Marker20position = GMSGeometryOffset(positionofmarkerA,  20 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D Marker2020position = GMSGeometryOffset(positionofmarkerB,  20 * inFeet, ABHeading -90);
    
    GMSMutablePath *path20 = [GMSMutablePath path];
    [path20 addCoordinate:Marker20position];
    [path20 addCoordinate:Marker2020position];
    
    
    GMSPolyline *centerline20 = [GMSPolyline polylineWithPath:path20];
    centerline20.map = mapView_;
    
    //21-2121
    
    CLLocationCoordinate2D Marker21position = GMSGeometryOffset(positionofmarkerA,  21 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D Marker2121position = GMSGeometryOffset(positionofmarkerB,  21 * inFeet, ABHeading -90);
    
    GMSMutablePath *path21 = [GMSMutablePath path];
    [path21 addCoordinate:Marker21position];
    [path21 addCoordinate:Marker2121position];
    
    
    GMSPolyline *centerline21 = [GMSPolyline polylineWithPath:path21];
    centerline21.map = mapView_;
    
    
    //22 -2222
    
    CLLocationCoordinate2D Marker22position = GMSGeometryOffset(positionofmarkerA,  22 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D Marker2222position = GMSGeometryOffset(positionofmarkerB,  22 * inFeet, ABHeading -90);
    
    GMSMutablePath *path22 = [GMSMutablePath path];
    [path22 addCoordinate:Marker22position];
    [path22 addCoordinate:Marker2222position];
    
    
    GMSPolyline *centerline22 = [GMSPolyline polylineWithPath:path22];
    centerline22.map = mapView_;
    
    //23 -2323
    
    CLLocationCoordinate2D Marker23position = GMSGeometryOffset(positionofmarkerA,  23 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D Marker2323position = GMSGeometryOffset(positionofmarkerB,  23 * inFeet, ABHeading -90);
    
    GMSMutablePath *path23 = [GMSMutablePath path];
    [path23 addCoordinate:Marker23position];
    [path23 addCoordinate:Marker2323position];
    
    
    GMSPolyline *centerline23 = [GMSPolyline polylineWithPath:path23];
    centerline23.map = mapView_;
    
    //24 -2424
    
    CLLocationCoordinate2D Marker24position = GMSGeometryOffset(positionofmarkerA,  24 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D Marker2424position = GMSGeometryOffset(positionofmarkerB,  24 * inFeet, ABHeading -90);
    
    GMSMutablePath *path24 = [GMSMutablePath path];
    [path24 addCoordinate:Marker24position];
    [path24 addCoordinate:Marker2424position];
    
    
    GMSPolyline *centerline24 = [GMSPolyline polylineWithPath:path24];
    centerline24.map = mapView_;
    
    //25-2525
    
    CLLocationCoordinate2D Marker25position = GMSGeometryOffset(positionofmarkerA,  25 * inFeet, ABHeading -90);
    
    CLLocationCoordinate2D Marker2525position = GMSGeometryOffset(positionofmarkerB,  25 * inFeet, ABHeading -90);
    
    GMSMutablePath *path25 = [GMSMutablePath path];
    [path25 addCoordinate:Marker25position];
    [path25 addCoordinate:Marker2525position];
    
    
    GMSPolyline *centerline25 = [GMSPolyline polylineWithPath:path25];
    centerline25.map = mapView_;
 
    
    
    
    
}

-(void)boomIntervalTest{
    
    
    if (height < stringDouble  - stringDouble / 2)
    {
        stringDoubleMultiplier = 0;
    
    }
     if (height > stringDouble - stringDouble / 2 && height < stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 1 ;
      
    }
     if (height > 2 * stringDouble - stringDouble / 2 && height < 2 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 2;
    
    }
     if (height > 3 * stringDouble - stringDouble / 2 && height < 3 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 3;
        
    }
     if (height > 4 * stringDouble - stringDouble / 2 && height < 4 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 4;
        
    }
     if (height > 5 * stringDouble - stringDouble / 2 && height < 5 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 5;
      
    }
     if (height > 6 * stringDouble - stringDouble / 2 && height < 6 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 6;
        
    }
     if (height > 7 * stringDouble - stringDouble / 2 && height < 7 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 7;
       
    }
     if (height > 8 * stringDouble - stringDouble / 2 && height < 8 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 8;
        
    }
     if (height > 9 * stringDouble - stringDouble / 2 && height < 9 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 9;
        
    }
    if (height > 10 * stringDouble - stringDouble / 2 && height < 10 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 10;
        
    }
     if (height > 11 * stringDouble - stringDouble / 2 && height < 11 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 11;
        
    }
    
     if (height > 12 * stringDouble - stringDouble / 2 && height < 12 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 12;
       
    }
    
     if (height > 13 * stringDouble - stringDouble / 2 && height < 13 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 13;
        
    }
    
     if (height > 14 * stringDouble - stringDouble / 2 && height < 14 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 14;
        
    }
    
    if (height > 15 * stringDouble - stringDouble / 2 && height < 15 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 15;
 
    }
    
     if (height > 16 * stringDouble - stringDouble / 2 && height < 16 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 16;
        
    }
    
     if (height > 17 * stringDouble - stringDouble / 2 && height < 17 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 17;
        
    }
    
     if (height > 18 * stringDouble - stringDouble / 2 && height < 18 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 18;
       
    }
    
     if (height > 19 * stringDouble - stringDouble / 2 && height < 19 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 19;
        
    }
    
    if (height > 20 * stringDouble - stringDouble / 2 && height < 20 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 20;

    }
    
     if (height > 21 * stringDouble - stringDouble / 2 && height < 21 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 21;
      
    }
    
     if (height > 22 * stringDouble - stringDouble / 2 && height < 22 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 22;
        
    }
    
     if (height > 23 * stringDouble - stringDouble / 2 && height < 23 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 23;
       
    }
    
    if (height > 24 * stringDouble - stringDouble / 2 && height < 24 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 24;
       
    }
    
    if (height > 25 * stringDouble - stringDouble / 2 && height < 25 * stringDouble + stringDouble / 2)
    {
        stringDoubleMultiplier = 25;
       
    }

    
    
    
    
}


- (IBAction)boomIntervalDisplay:(id)sender {
    
    
    
}



-(void)arrowControl {
  
    
    //code in mapFlipper. handles arrows when you turn around and go the other way
    //code in the heightMagnitude -- height value is always positive, so you need to know which side of line
    
    
    if (mapFlipper==YES)
    {
        if (heightMagnitude==NO)
        {
            
           
            
            if (height >= stringDouble * stringDoubleMultiplier - 0.1 && height <= 0.1 + stringDouble * stringDoubleMultiplier)
            {
                
                
                arrowup = [UIImage imageNamed:@"arrowup"];
                [arrowView setImage:arrowup];
                
                //up
            }
             if (height < stringDouble * stringDoubleMultiplier - 0.1 && height > stringDouble * stringDoubleMultiplier - 0.5)
            {
                arrowrt1 = [UIImage imageNamed:@"arrowright1"];
                [arrowView setImage:arrowrt1]; //right
            }
             if (height < stringDouble * stringDoubleMultiplier - 0.5 && height > stringDouble * stringDoubleMultiplier - 1.0)
            {
                arrowrt2 = [UIImage imageNamed:@"arrowright2"];
                [arrowView setImage:arrowrt2];
            }
            if (height < stringDouble * stringDoubleMultiplier - 1.0 && height > stringDouble * stringDoubleMultiplier - 1.5)
            {
                arrowrt3 = [UIImage imageNamed:@"arrowright3"];
                [arrowView setImage:arrowrt3];
            }
            if (height < stringDouble * stringDoubleMultiplier - 1.5 && height > stringDouble * (1 + stringDoubleMultiplier) - stringDouble / 2)
            {
                arrowrt4 = [UIImage imageNamed:@"arrowright4"];
                [arrowView setImage:arrowrt4];
            }
             if (height > 0.1 + stringDouble * stringDoubleMultiplier && height < 0.5 + stringDouble * stringDoubleMultiplier)
            {
                arrowlt1 = [UIImage imageNamed:@"arrowleft1"];
                [arrowView setImage:arrowlt1]; //left1
            }
            if (height > 0.5 + stringDouble * stringDoubleMultiplier && height < 1.0 + stringDouble * stringDoubleMultiplier)
            {
                arrowlt2 = [UIImage imageNamed:@"arrowleft2"];
                [arrowView setImage:arrowlt2];
            }
             if (height > 1.0 + stringDouble * stringDoubleMultiplier && height < 1.5 + stringDouble * stringDoubleMultiplier)
            {
                arrowlt3 = [UIImage imageNamed:@"arrowleft3"];
                [arrowView setImage:arrowlt3];
            }
            if (height > 1.5 + stringDouble * stringDoubleMultiplier && height < stringDouble * (1 + stringDoubleMultiplier) - stringDouble / 2)
            {
                arrowlt4 = [UIImage imageNamed:@"arrowleft4"];
                [arrowView setImage:arrowlt4];            }
            
            
            
        }
        if (heightMagnitude==YES)
        {
            if (height >= stringDouble * stringDoubleMultiplier - 0.1 && height <= 0.1 + stringDouble * stringDoubleMultiplier)
            {
                arrowup = [UIImage imageNamed:@"arrowup"];
                [arrowView setImage:arrowup]; //up
            }
             if (height < stringDouble * stringDoubleMultiplier - 0.1 && height > stringDouble * stringDoubleMultiplier - 0.5)
            {
                arrowlt1 = [UIImage imageNamed:@"arrowleft1"];
                [arrowView setImage:arrowlt1]; //left1
            }
            if (height < stringDouble * stringDoubleMultiplier - 0.5 && height > stringDouble * stringDoubleMultiplier - 1.0)
            {
                arrowlt2 = [UIImage imageNamed:@"arrowleft2"];
                [arrowView setImage:arrowlt2];
            }
            if (height < stringDouble * stringDoubleMultiplier - 1.0 && height > stringDouble * stringDoubleMultiplier - 1.5)
            {
                arrowlt3 = [UIImage imageNamed:@"arrowleft3"];
                [arrowView setImage:arrowlt3];


            }
            if (height < stringDouble * stringDoubleMultiplier - 1.5 && height > stringDouble * (1 + stringDoubleMultiplier) - stringDouble / 2)
            {
                arrowlt4 = [UIImage imageNamed:@"arrowleft4"];
                [arrowView setImage:arrowlt4];
            }
            if (height > 0.1 + stringDouble * stringDoubleMultiplier && height < 0.5 + stringDouble * stringDoubleMultiplier)
            {
                arrowrt1 = [UIImage imageNamed:@"arrowright1"];
                [arrowView setImage:arrowrt1]; //right1
            }
            if (height > 0.5 + stringDouble * stringDoubleMultiplier && height < 1.0 + stringDouble * stringDoubleMultiplier)
            {
                arrowrt2 = [UIImage imageNamed:@"arrowright2"];
                [arrowView setImage:arrowrt2];
            }
            if (height > 1.0 + stringDouble * stringDoubleMultiplier && height < 1.5 + stringDouble * stringDoubleMultiplier)
            {
                arrowrt3 = [UIImage imageNamed:@"arrowright3"];
                [arrowView setImage:arrowrt3];
            }
            if (height > 1.5 + stringDouble * stringDoubleMultiplier && height < stringDouble * (1 + stringDoubleMultiplier) - stringDouble / 2)
            {
                arrowrt4 = [UIImage imageNamed:@"arrowright4"];
                [arrowView setImage:arrowrt4];
            }
        }
    }
    if (mapFlipper==NO)
    {
        if (heightMagnitude==NO)
        {
            if (height >= stringDouble * stringDoubleMultiplier - 0.1 && height <= 0.1 + stringDouble * stringDoubleMultiplier)
            {
                arrowup = [UIImage imageNamed:@"arrowup"];
                [arrowView setImage:arrowup]; //up
            }
            if (height < stringDouble * stringDoubleMultiplier - 0.1 && height > stringDouble * stringDoubleMultiplier - 0.5)
            {
                arrowlt1 = [UIImage imageNamed:@"arrowleft1"];
                [arrowView setImage:arrowlt1]; //left1
            }
            if (height < stringDouble * stringDoubleMultiplier - 0.5 && height > stringDouble * stringDoubleMultiplier - 1.0)
            {
                arrowlt2 = [UIImage imageNamed:@"arrowleft2"];
                [arrowView setImage:arrowlt2];
            }
            if (height < stringDouble * stringDoubleMultiplier - 1.0 && height > stringDouble * stringDoubleMultiplier - 1.5)
            {
                arrowlt3 = [UIImage imageNamed:@"arrowleft3"];
                [arrowView setImage:arrowlt3];
            }
            if (height < stringDouble * stringDoubleMultiplier - 1.5 && height > -stringDouble * (1 + stringDoubleMultiplier) + stringDouble / 2)
            {
                arrowlt4 = [UIImage imageNamed:@"arrowleft4"];
                [arrowView setImage:arrowlt4];
            }
            if (height > 0.1 + stringDouble * stringDoubleMultiplier && height < 0.5 + stringDouble * stringDoubleMultiplier)
            {
                arrowrt1 = [UIImage imageNamed:@"arrowright1"];
                [arrowView setImage:arrowrt1];//right1
            }
            if (height > 0.5 + stringDouble * stringDoubleMultiplier && height < 1.0 + stringDouble * stringDoubleMultiplier)
            {
                arrowrt2 = [UIImage imageNamed:@"arrowright2"];
                [arrowView setImage:arrowrt2];
            }
            if (height > 1.0 + stringDouble * stringDoubleMultiplier && height < 1.5 + stringDouble * stringDoubleMultiplier)
            {
                arrowrt3 = [UIImage imageNamed:@"arrowright3"];
                [arrowView setImage:arrowrt3];
            }
             if (height > 1.5 + stringDouble * stringDoubleMultiplier && height < stringDouble * (1 + stringDoubleMultiplier) - stringDouble / 2)
            {
                arrowrt4 = [UIImage imageNamed:@"arrowright4"];
                [arrowView setImage:arrowrt4];
            }
        }
        if (heightMagnitude==YES)
        {
            if (height >= stringDouble * stringDoubleMultiplier - 0.1 && height <= 0.1 + stringDouble * stringDoubleMultiplier)
            {
                arrowup = [UIImage imageNamed:@"arrowup"];
                [arrowView setImage:arrowup];//up
            }
            if (height < stringDouble * stringDoubleMultiplier - 0.1 && height > stringDouble * stringDoubleMultiplier - 0.5)
            {
                arrowrt1 = [UIImage imageNamed:@"arrowright1"];
                [arrowView setImage:arrowrt1];//right1
            }
            if (height < stringDouble * stringDoubleMultiplier - 0.5 && height > stringDouble * stringDoubleMultiplier - 1.0)
            {
                arrowrt2 = [UIImage imageNamed:@"arrowright2"];
                [arrowView setImage:arrowrt2];
            }
            if (height < stringDouble * stringDoubleMultiplier - 1.0 && height > stringDouble * stringDoubleMultiplier - 1.5)
            {
                arrowrt3 = [UIImage imageNamed:@"arrowright3"];
                [arrowView setImage:arrowrt3];
            }
            if (height < stringDouble * stringDoubleMultiplier - 1.5 && height > -stringDouble * (1 + stringDoubleMultiplier) + stringDouble / 2)
            {
                arrowrt4 = [UIImage imageNamed:@"arrowright4"];
                [arrowView setImage:arrowrt4];
            }
            if (height > 0.1 + stringDouble * stringDoubleMultiplier && height < 0.5 + stringDouble * stringDoubleMultiplier)
            {
                arrowlt1 = [UIImage imageNamed:@"arrowleft1"];
                [arrowView setImage:arrowlt1];//left1
            }
            if (height > 0.5 + stringDouble * stringDoubleMultiplier && height < 1.0 + stringDouble * stringDoubleMultiplier)
            {
                arrowlt2 = [UIImage imageNamed:@"arrowleft2"];
                [arrowView setImage:arrowlt2];
            }
            if (height > 1.0 + stringDouble * stringDoubleMultiplier && height < 1.5 + stringDouble * stringDoubleMultiplier)
            {
                arrowlt3 = [UIImage imageNamed:@"arrowleft3"];
                [arrowView setImage:arrowlt3];
            }
            if (height > 1.5 + stringDouble * stringDoubleMultiplier && height < stringDouble * (1 + stringDoubleMultiplier) - stringDouble / 2)
            {
                arrowlt4 = [UIImage imageNamed:@"arrowleft4"];
                [arrowView setImage:arrowlt4];
            }
        }
    }

    
    
    
    
    
    
    
}


@end

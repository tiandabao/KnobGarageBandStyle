//
//  KnobViewController.m
//  Knob
//
//  Created by Krutarth Majithiya on 12/12/11.
//

#import "KnobViewController.h"


@interface KnobViewController() {
@private CGFloat imageAngle;
@private KnobViewSensor *knobSensor;
}
-(void) startKnobSensor;
@end

@implementation KnobViewController

@synthesize knobImage;

#pragma mark - Start sensing 

//KnobImage position calculation as well as determining the center point
- (void) startKnobSensor {
    // calculate center and radius of the control
    CGPoint midPoint = CGPointMake(knobImage.frame.origin.x + knobImage.frame.size.width / 2,
                                   knobImage.frame.origin.y + knobImage.frame.size.height / 2);
    CGFloat outRadius = knobImage.frame.size.width / 2;
    
    // outRadius / 4 is arbitrary, just choose something >> 0 to avoid strange 
    // effects when touching the control near of it's center
    knobSensor = [[KnobViewSensor alloc] initWithMidPoint: midPoint innerRadius: outRadius / 4 outerRadius: outRadius target: self];
    [self.view addGestureRecognizer: knobSensor];
}

#pragma mark - Sensor delegate method

- (void) rotation: (CGFloat) angle
{
    // calculate rotation angle
    imageAngle += angle;
    if (imageAngle > 360)
        imageAngle -= 360;
    else if (imageAngle < -360)
        imageAngle += 360;
    
    // rotate image and update text field
    knobImage.transform = CGAffineTransformMakeRotation(imageAngle *  M_PI / 180);
}

- (void) finalAngle: (CGFloat) angle
{
    NSLog(@"Angle = %f", angle);
}

#pragma mark - View lifecycle
- (void)viewDidLoad{
    [super viewDidLoad];
    imageAngle = MIN_ANGLE;
    [self rotation:imageAngle];
    [self startKnobSensor];
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return NO;
}

- (void) dealloc{
    [super dealloc];
}

@end

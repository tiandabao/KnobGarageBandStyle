//
//  KnobViewController.h
//  Knob
//
//  Created by Krutarth Majithiya on 12/12/11.
//

#import <UIKit/UIKit.h>
#import "KnobViewSensor.h"

@interface KnobViewController : UIViewController<KnobViewSensorDelegate>

@property  (nonatomic, strong) IBOutlet UIImageView *knobImage;

@end

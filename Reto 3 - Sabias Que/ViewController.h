#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) UILabel *factLabel;
@property (nonatomic, strong) UIButton *motoButton;
@property (nonatomic, strong) UIButton *hikingButton;
@property (nonatomic, strong) UIButton *homeButton;
@property (nonatomic, strong) UIButton *nextFactButton;
@property (nonatomic, strong) NSString *selectedCategory;
@property (nonatomic, strong) NSDictionary *facts;
@property (nonatomic, assign) NSInteger currentIndex;

@end
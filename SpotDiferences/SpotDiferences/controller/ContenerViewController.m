//
//  ContenerViewController.m
//  SpotDiferences
//
//  Created by Mobile Team (G4M) on 9/27/12.
//
//

#import "ContenerViewController.h"
#import "UikitFramework.h"
#import "InicialViewController.h"

@interface ContenerViewController ()
@property (nonatomic,weak) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UIView *container;

@end

@implementation ContenerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.imageview.image = [UIImage imageNamed:@"background_clear"];
    }

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIImage *bimage = [UIImage imageNamed:@"btn_back"];
    
    UIButton *bbutton = [UikitFramework createButtonWithBackgroudImage:@"btn_back" title:@"" positionX:10 positionY:5];
    [bbutton addTarget:self action:@selector(backButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bbutton];
    
    UIButton *homeButton = [UikitFramework createButtonWithBackgroudImage:@"btn_home" title:@"" positionX:self.view.frame.size.width - 10 - bimage.size.width positionY:5];
    [homeButton addTarget:self action:@selector(homeButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:homeButton];
    
}

-(void)backButtonTapped:(UIButton*)sender
{
    [[self navigationController]popViewControllerAnimated:YES];
}

- (IBAction) backToHome {
    NSArray *viewControllers = [[self navigationController] viewControllers];
    for (int c=0; c < [viewControllers count]; c++) {
        id obj = [viewControllers objectAtIndex:c];
        if([obj isKindOfClass:[InicialViewController class]])
            [self.navigationController popToViewController:obj animated:YES];
    }
}

-(void)homeButtonTapped:(UIButton*)sender
{
    [self backToHome];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setContainer:nil];
    [super viewDidUnload];
}
@end

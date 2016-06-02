//
//  BattleViewController.m
//  MCMS
//
//  Created by Andrew Bihl on 6/1/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

#import "BattleViewController.h"

@interface BattleViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *fighterOneImage;
@property (weak, nonatomic) IBOutlet UIImageView *fighterTwoImage;
@property (weak, nonatomic) IBOutlet UILabel *fighter1Label;
@property (weak, nonatomic) IBOutlet UILabel *fighter2Label;
@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;

@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fighter1Label.text = self.fighter1.name;
    self.fighter2Label.text = self.fighter2.name;
    int r = rand()%2;
    NSLog(self.fighter2.name);
    if (r==0)
        self.winnerLabel.text =[NSString stringWithFormat:@"%@ wins!", self.fighter1.name];
    else
        self.winnerLabel.text = [NSString stringWithFormat:@"%@ wins!", self.fighter2.name];
        
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"battleBackground.jpg"] drawInRect:self.view.bounds];
    UIImage* backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
    self.title = [NSString stringWithFormat:@"%@ vs. %@",self.fighter1.name,self.fighter2.name];
    self.fighterOneImage.image = [UIImage imageNamed:self.fighter1.imageName];
    self.fighterTwoImage.image = [UIImage imageNamed:self.fighter2.imageName];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

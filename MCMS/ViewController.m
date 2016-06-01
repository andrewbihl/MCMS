//
//  ViewController.m
//  MCMS
//
//  Created by Andrew Bihl on 6/1/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property NSMutableArray* creatures;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.creatures = [NSMutableArray new];
    MagicalCreature* creature1 = [[MagicalCreature alloc]initWithName:@"Chris the Protector of the Night Realm"];
    MagicalCreature* creature2 = [[MagicalCreature alloc]initWithName:@"Andrew the Asshole"];
    MagicalCreature* creature3 = [[MagicalCreature alloc]initWithName:@"Big Ben"];
    [self.creatures addObjectsFromArray:@[creature1,creature2,creature3]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onAddPressed:(id)sender {
    MagicalCreature* newCreature = [[MagicalCreature alloc]initWithName:self.textField.text];
    [self.creatures addObject:newCreature];
    self.textField.text = @"";
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.creatures.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    MagicalCreature* current = self.creatures[indexPath.row];
    cell.textLabel.text = current.name;
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIViewController* dvc = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    MagicalCreature *current = [self.creatures objectAtIndex:indexPath.row];
    dvc.title = current.name;
}











@end

//
//  TableViewController.m
//  ObjCPokedex
//
//  Created by Jeremy Warren on 9/30/21.
//

#import "TableViewController.h"


@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [PokemonManager fetchPokemonWithCompletion:^(NSArray * _Nonnull pokemon) {
            self.pokemon = pokemon;
        dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
        });
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.pokemon.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pokemonCell" forIndexPath:indexPath];
    
    Pokemon *pokemon = self.pokemon[indexPath.row];
    
    cell.textLabel.text = pokemon.name.capitalizedString;
    
    return cell;
}

@end

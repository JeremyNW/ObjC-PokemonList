//
//  PokemonManager.m
//  ObjCPokedex
//
//  Created by Jeremy Warren on 9/30/21.
//

#import "PokemonManager.h"


@implementation PokemonManager

+ (void)fetchPokemonWithCompletion:(void (^)(NSArray *))completion {
    
    NSURL *url = [NSURL URLWithString:@"https://pokeapi.co/api/v2/pokemon/"];
    NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    NSURLQueryItem *limitQueryItem = [NSURLQueryItem queryItemWithName:@"limit" value:@"151"];
    components.queryItems = @[limitQueryItem];
    NSURL *finalURL = components.URL;
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                 
        if (error) {
            NSLog(@"%@", error.localizedDescription);
            completion(NULL);
            return;
        }
        
        if (!data) {
            completion(NULL);
            return;
        }
        
        
        NSMutableArray *decodedPokemon = [NSMutableArray new];
        
        NSDictionary *apiResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSArray *results = apiResponse[@"results"];
        
        for (NSDictionary *pokemonDictionary in results) {
            NSString *name = pokemonDictionary[@"name"];
            Pokemon *pokemon = [[Pokemon alloc] initWithName:name];
            [decodedPokemon addObject:pokemon];
        }
        
        completion(decodedPokemon);
        
    }] resume];
    
    
    
    
    
    
    
    
    
    
    
}

@end

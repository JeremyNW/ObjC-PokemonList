//
//  PokemonManager.h
//  ObjCPokedex
//
//  Created by Jeremy Warren on 9/30/21.
//

#import <Foundation/Foundation.h>
#import "Pokemon.h"

NS_ASSUME_NONNULL_BEGIN

@interface PokemonManager : NSObject

+ (void) fetchPokemonWithCompletion:(void (^)(NSArray *pokemon))completion;

@end

NS_ASSUME_NONNULL_END

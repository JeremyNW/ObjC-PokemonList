//
//  Pokemon.h
//  ObjCPokedex
//
//  Created by Jeremy Warren on 9/30/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Pokemon : NSObject

@property NSString *name;

- (instancetype) initWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END

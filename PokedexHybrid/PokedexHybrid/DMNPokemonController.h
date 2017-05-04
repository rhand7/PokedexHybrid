//
//  DMNPokemonController.h
//  PokedexHybrid
//
//  Created by handje on 5/4/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DMNPokemon;

NS_ASSUME_NONNULL_BEGIN  //assume methods we implement here always have a value

@interface DMNPokemonController : NSObject

//Nullable is a way to bridge into Swift 
+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion: (void (^_Nullable)(DMNPokemon * _Nullable)) completion;

@end

NS_ASSUME_NONNULL_END

//
//  DMNPokemon.h
//  PokedexHybrid
//
//  Created by handje on 5/4/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMNPokemon : NSObject

- (instancetype)initWithName:(NSString *)name
                 identifier:(NSInteger)identifier
                 abilities:(NSArray<NSString *> *)abilities NS_DESIGNATED_INITIALIZER;
                                                            //need this b/c all inits in ObjC are failable

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;   //casting as NSString, only allows for NSString

@end

#pragma mark - JSON Convertible 

@interface DMNPokemon (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

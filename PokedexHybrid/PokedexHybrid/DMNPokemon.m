//
//  DMNPokemon.m
//  PokedexHybrid
//
//  Created by handje on 5/4/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

#import "DMNPokemon.h"

@implementation DMNPokemon

// Must override init b/c in obj-c you can call its base init to create a nil obj. But in swift you cannot.
- (instancetype)init
{
    return [self initWithName:@"" identifiere:0 abilities:@[]];
}

// Designated init
- (instancetype)initWithName:(NSString *)name identifiere:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities
{
    self = [super init];
    if (self) {
        _name = [name copy];
        _identifier = identifier;
        _abilities = [abilities copy];
    }
    return self;
}

@end


#pragma mark - JSONConvertible

@implementation DMNPokemon (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[@"name"];
    NSInteger identifier = [dictionary[@"id"] integerValue];  //casting to our NSIntergerValue as integerValue
    NSArray *abilityDictionaries = dictionary[@"abilities"];
    
    //this is our guard let statement from swift
    if (![name isKindOfClass:[NSString class]]
        || ![abilityDictionaries isKindOfClass:[NSArray class]]) {     //checking for an array b/c it returns mult abilities(array)
        return nil;
    }
    
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    for (NSDictionary *dictionary in abilityDictionaries) {
        NSString *abilityName = dictionary[@"ability"][@"name"];
        if (!abilityName) { continue; } //if abilityName doesn't exist, then continue to next iterartion of array
        [abilities addObject:abilityName];  //appendingObject
    }
    
    return [self initWithName:name identifier:identifier abilities:abilities]; //returning and initializing our object 
}

@end

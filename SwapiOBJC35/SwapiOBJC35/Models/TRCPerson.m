//
//  TRCPerson.m
//  SwapiOBJC35
//
//  Created by Todd Crandall on 8/13/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

#import "TRCPerson.h"

@implementation TRCPerson

- (instancetype)initWithName:(NSString *)name birthYear:(NSString *)birthYear;
{
    self = [super init];
    if (self)
    {
    _name = name;
    _birthYear = birthYear;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithName:@"" birthYear:@""];
}


@end

@implementation TRCPerson (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary

{
    NSString * name = dictionary[@"name"];
    NSString * birthYear = dictionary[@"birth_year"];
    
//    NSMutableArray<NSString * > * films = [NSMutableArray new];
//    for (NSDictionary * filmDictionary in filmsArray) {
//        NSDictionary * nestedDictionary = filmDictionary[@"films"];
//        NSDictionary * filmName = nestedDictionary[@"title"];
//        [films addObject:filmName];
//    }
    
return [self initWithName:name birthYear:birthYear];
}
@end

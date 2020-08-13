//
//  TRCPerson.h
//  SwapiOBJC35
//
//  Created by Todd Crandall on 8/13/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TRCPerson : NSObject

@property (nonatomic, copy, readonly, nonnull)NSString * name;
@property (nonatomic, copy, readonly, nullable)NSString * birthYear;

- (instancetype)initWithName:(NSString *)name
                   birthYear:(NSString *)birthYear;

@end

@interface TRCPerson (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSMutableArray *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END

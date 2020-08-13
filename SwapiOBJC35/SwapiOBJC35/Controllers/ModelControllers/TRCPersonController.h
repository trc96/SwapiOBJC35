//
//  TRCPersonController.h
//  SwapiOBJC35
//
//  Created by Todd Crandall on 8/13/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRCPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface TRCPersonController : NSObject

+(instancetype)sharedInstance;

@property (nonatomic, copy)NSArray<TRCPerson * > * people;

-(void)fetchPeople: (void(^) (BOOL))completion;

@end

NS_ASSUME_NONNULL_END

//
//  TRCPersonController.m
//  SwapiOBJC35
//
//  Created by Todd Crandall on 8/13/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

#import "TRCPersonController.h"

static NSString * const baseURL = @"https://swapi.dev/api";
static NSString * const peopleComponent = @"people";
//static NSString * const jsonExtension = @"json";

@implementation TRCPersonController

+(instancetype)sharedInstance
{
    static TRCPersonController * sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        sharedInstance = [TRCPersonController new];
    });
    return sharedInstance;
}

-(void)fetchPeople:(void (^)(BOOL))completion
{
    NSURL * url = [NSURL URLWithString:baseURL];
    NSURL * finalURL = [url URLByAppendingPathComponent:peopleComponent];
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil); return;
        }
        
        if (!data)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(false);
            return;
        }
        
        NSDictionary * topLevelJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (!topLevelJSON)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(false);
            return;
        }
        
        NSMutableArray * arrayOfPeople = [NSMutableArray new];
        
        NSDictionary * currentDictionary = topLevelJSON[@"results"];
        
        for (NSDictionary * personDictionary in currentDictionary)
        {
            TRCPerson * person = [[TRCPerson alloc] initWithDictionary:personDictionary];
            [arrayOfPeople addObject:person];
        }
        
        if (arrayOfPeople.count != 0)
        {
            TRCPersonController.sharedInstance.people = arrayOfPeople;
            completion(true);
        } else {
            completion(false);
        }
        
    }] resume];
}

@end

//
//  XMWCardController.m
//  DeckOfCardsC
//
//  Created by Xavier on 11/1/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

#import "XMWCardController.h"
#import "XMWCard.h"



@implementation XMWCardController

//SharedInstance/Singelton
+ (instancetype) sharedController {
    static XMWCardController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [XMWCardController new];
    });
    return shared;
}

+(NSURL *)baseUrl
{
    return [NSURL URLWithString:@"https://deckofcardsapi.com/api/deck/new/draw"];
}



//Fetching
+ (void)drawNewCard:(void (^)(NSArray<XMWCard *> * _Nonnull, NSError * _Nonnull))completion
{
    //Construct URL
    
    //Components
    NSURLComponents *components = [NSURLComponents componentsWithURL: [XMWCardController baseUrl] resolvingAgainstBaseURL:TRUE];
    NSURLQueryItem *searchQueryItem = [NSURLQueryItem queryItemWithName:@"count" value:@"1"];
    
    components.queryItems = @[searchQueryItem];
    
    NSURL *completedURL = [components URL];
    
    NSLog(@"%@", [completedURL absoluteString]);
    
    
    //Request
    //No need to make a request!
    
    //DataTask+Resume
    [[[NSURLSession sharedSession] dataTaskWithURL:completedURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil,error);
            return;
        }
        NSLog(@"%@", response);
        
        if(!data){
            NSLog(@"No DATA AVAILABLE");
            completion(nil, error);
            return;
        }
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if(!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"jsonDictionary is not dictionary class");
            completion(nil,error);
            return;
        }
        NSArray *cardArray = jsonDictionary[@"cards"];
        NSDictionary *cardDictionary = [cardArray objectAtIndex:0];
        
        // NOTE: - PlaceHolder
        NSMutableArray *cardsArray = [NSMutableArray array];
        XMWCard *card = [[XMWCard alloc] initWithDictionary:cardDictionary];
        [cardsArray addObject:card];
        completion(cardsArray, nil);
    }]resume];
}

+ (void)fetchImage:(XMWCard *)card completion:(void (^)(UIImage * _Nonnull, NSError * _Nonnull))completion
{
    NSURL *imageURL = [NSURL URLWithString:card.image];
    NSLog(@"%@", imageURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            
            NSLog(@"Error in %s, %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil, error);
            return;
        }
        if (!data){
            NSLog(@"No Data Avaliable");
            completion(nil, error);
            return;
        }
        UIImage *cardImage = [UIImage imageWithData:data];
        completion(cardImage, nil);
    }] resume];
}



@end

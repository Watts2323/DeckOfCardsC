//
//  XMWCard.h
//  DeckOfCardsC
//
//  Created by Xavier on 10/31/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMWCard : NSObject

@property (nonatomic, copy, readonly) NSString *suit;
@property (nonatomic,copy, readonly) NSString *image;

-(instancetype)initWithSuit:(NSString *)suit image:(NSString *)image;

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END

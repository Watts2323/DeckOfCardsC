//
//  XMWCard.m
//  DeckOfCardsC
//
//  Created by Xavier on 10/31/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

#import "XMWCard.h"

@implementation XMWCard

- (instancetype)initWithSuit:(NSString *)suit image:(NSString *)image
{
    self = [super init];
    if (self) {
        _suit = [suit copy];
        _image = image;
    }
    return self;
}

@end

@implementation XMWCard (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *suit = dictionary [[XMWCard suitTitleKey ]];
    NSString *image = dictionary[[XMWCard imageTitleKey]];
    return [self initWithSuit:suit image:image];
}

+(NSString *) suitTitleKey;
{
    return @"suit";
}

+(NSString *) imageTitleKey;
{
    return @"image";
}

@end

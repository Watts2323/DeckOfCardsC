//
//  XMWCardController.h
//  DeckOfCardsC
//
//  Created by Xavier on 11/1/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

#import <UIKit/UIKit.h>
//The difference between the @class and import is that Import gives you everything, its more like a copy and paste. The @class specifies that you are only going to use that class. helps compiler load time.
@class XMWCard;

NS_ASSUME_NONNULL_BEGIN

@interface XMWCardController : NSObject

+(instancetype)sharedController;

+(void)drawNewCard:(void (^)(NSArray<XMWCard *> *cards, NSError *error))completion;

+(void)fetchImage:(XMWCard *)card completion:(void (^)(UIImage *cardImage, NSError *error))completion;


@end

NS_ASSUME_NONNULL_END

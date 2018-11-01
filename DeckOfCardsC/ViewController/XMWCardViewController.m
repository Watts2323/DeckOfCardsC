//
//  XMWCardViewController.m
//  DeckOfCardsC
//
//  Created by Xavier on 11/1/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

#import "XMWCardViewController.h"
#import "XMWCardController.h"
#import "XMWCard.h"

@interface XMWCardViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;
@property (weak, nonatomic) IBOutlet UIButton *drawCardButton;
@property (weak, nonatomic) IBOutlet UILabel *suitLabel;

@end

@implementation XMWCardViewController

- (IBAction)drawCardButtonTapped:(UIButton *)sender {
    [XMWCardController drawNewCard:^(NSArray<XMWCard *> * _Nonnull cards, NSError * _Nonnull error) {
        
        [XMWCardController fetchImage:cards[0] completion:^(UIImage * _Nonnull cardImage, NSError * _Nonnull error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.suitLabel.text = cards[0].suit;
                self.cardImageView.image = cardImage;
            });
        }];
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end

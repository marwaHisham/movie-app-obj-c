//
//  SingleView.h
//  movies
//
//  Created by IOS OS on 3/1/18.
//  Copyright © 2018 IOS OS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "MovieAPI.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface SingleView : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *movietitle;
@property (weak, nonatomic) IBOutlet UILabel *publish;

/*@property (weak, nonatomic) IBOutlet UILabel *overview;*/
@property (weak, nonatomic) IBOutlet UIImageView *poster;

@property (weak, nonatomic) IBOutlet UITextView *overview;
- (IBAction)getTrailer:(id)sender;
@property Movie *singleMovie;
- (IBAction)favour_movie:(id)sender;
@end

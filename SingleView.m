//
//  SingleView.m
//  movies
//
//  Created by IOS OS on 3/1/18.
//  Copyright © 2018 IOS OS. All rights reserved.
//

#import "SingleView.h"
#import "HCSStarRatingView.h"
#import "movieDB.h"
@interface SingleView (){
HCSStarRatingView * rate;
}
@end

@implementation SingleView

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)viewWillAppear:(BOOL)animated{
    [_movietitle setText:_singleMovie.title];
    [_publish setText:_singleMovie.release_date];
	
    [_overview setText:_singleMovie.overview];
    
    
    NSString* stringImageURL =[MovieAPI GET_MOVIE_IMAGE_PATH_With_Image:_singleMovie.poster_path];
    
    
    NSURL* imageURL = [[NSURL alloc] initWithString:stringImageURL];
    [_poster sd_setImageWithURL: imageURL];
    
    
	
    rate = [[HCSStarRatingView alloc] initWithFrame:CGRectMake(230, 150, 100, 100)];
    rate.maximumValue = 5;
    rate.minimumValue = 0;
	rate.enabled=NO;
    rate.allowsHalfStars = YES;
    rate.value = [_singleMovie.vote_average floatValue]/2;
	
    rate.backgroundColor=[UIColor clearColor];
    rate.tintColor = [UIColor yellowColor];
    [self.view addSubview:rate];
    
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)getTrailer:(id)sender {
	/* NSString* stringVedioURL =[MovieAPI GET_MOVIE_TRAILERS_PATH:_singleMovie.id];
	NSString * youtubeUrl=[MovieAPI GET_YOUTUBE_PATH_FOR_KEY:@"%3C%3Capi_key%3E%3E"];*/
	NSString * urlmovie=@"https://api.themoviedb.org/3/movie/";
	NSString* trailersURL = @"";
	trailersURL = [urlmovie stringByAppendingString:[NSString stringWithFormat:@"%@",_singleMovie.id ]];
	trailersURL = [trailersURL stringByAppendingString:@"/videos"];
	trailersURL = [trailersURL stringByAppendingString:@"?api_key=af3f7a3b3e9279584ba5dd5ce9a884a8&language=en-US"];
	printf("======%s",[trailersURL UTF8String]);
	
	NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
	AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
		NSURL *URL = [NSURL URLWithString:trailersURL];
	NSURLRequest *request = [NSURLRequest requestWithURL:URL];
	NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
		if (error) {
			
			NSLog(@"Error: %@", error);
		} else {
			NSDictionary *jsonData=(NSDictionary *)responseObject;
			NSMutableArray *movieaArray = [NSMutableArray new];
			movieaArray = [jsonData objectForKey:@"results"];
			//printf("%s",[[movieaArray[0] objectForKey:@"key"]UTF8String]);
			NSString *videoName = [movieaArray[0] objectForKey:@"key"];
			NSString *string = [NSString stringWithFormat:@"http://www.youtube.com/watch?v=%@", videoName];
			NSURL *url = [NSURL URLWithString:string];
			UIApplication *app = [UIApplication sharedApplication];
			[app openURL:url];
			
			
}
	}];
	[dataTask resume];
 }
- (IBAction)favour_movie:(id)sender {
    movieDB *movieObj=[movieDB new];
	
	[movieObj addMovie:_singleMovie];
	 
	
	
}
	@end
//
//  MovieAPI.m
//  lab2
//
//
//  Copyright © 2018 Sara Ashraf. All rights reserved.
//

#import "MovieAPI.h"

@implementation MovieAPI{

   
}
const NSString* API_KEY = @"af3f7a3b3e9279584ba5dd5ce9a884a8";
const NSString* MOVIE_API_BASE_UTL = @"https://api.themoviedb.org/3/movie/";
const NSString* QUERY = @"?";
const NSString* QUERY_KEY = @"api_key=";
const NSString* QUERY_LANG_AND_PAGES = @"&language=en-US&page=1";
const NSString* IMAGE_PATH = @"https://image.tmdb.org/t/p/w185/";




+(NSString*) GET_POPULAR_MOVIES_URL{
    NSString* popularDir = @"popular";
    popularDir = [MOVIE_API_BASE_UTL stringByAppendingString:popularDir];
    popularDir = [popularDir stringByAppendingString:QUERY];
    popularDir = [popularDir stringByAppendingString:QUERY_KEY];
    popularDir = [popularDir stringByAppendingString:API_KEY];
    popularDir = [popularDir stringByAppendingString:QUERY_LANG_AND_PAGES];
    return popularDir;
}

+(NSString*) GET_TOP_RATED_MOVIES_URL{
    NSString* popularDir = @"top_rated";
    popularDir = [MOVIE_API_BASE_UTL stringByAppendingString:popularDir];
    popularDir = [popularDir stringByAppendingString:QUERY];
    popularDir = [popularDir stringByAppendingString:QUERY_KEY];
    popularDir = [popularDir stringByAppendingString:API_KEY];
    popularDir = [popularDir stringByAppendingString:QUERY_LANG_AND_PAGES];
    return popularDir;
}

+(NSString*) GET_MOVIE_IMAGE_PATH_With_Image:(NSString*)image {
    return [IMAGE_PATH stringByAppendingString:image];
}

+(NSString*) GET_MOVIE_TRAILERS_PATH:(NSString*)movieId{
    
    NSString* trailersURL = @"";
    trailersURL = [MOVIE_API_BASE_UTL stringByAppendingString:movieId];
    trailersURL = [trailersURL stringByAppendingString:@"/videos"];
    trailersURL = [trailersURL stringByAppendingString:QUERY];
    trailersURL = [trailersURL stringByAppendingString:QUERY_KEY];
    trailersURL = [trailersURL stringByAppendingString:API_KEY];
    trailersURL = [trailersURL stringByAppendingString:@"&language=en-US"];
    
    
    printf("============================%s",trailersURL);
    return trailersURL;

}


+(NSString*) GET_YOUTUBE_PATH_FOR_KEY:(NSString*)key{
    
    
    NSString *string = [NSString stringWithFormat:@"http://www.youtube.com/watch?v=%@", key];
    
       return string;
    
}











@end

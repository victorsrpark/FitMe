//
//  Singleton.h
//  FitMe
//
//  Created by Donald Seo on 2015. 8. 30..
//  Copyright (c) 2015년 Donald Seo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject {
    NSMutableArray *result;
}
@property (nonatomic, retain) NSMutableArray *result;

+ (Singleton*)SingletonInstance;
@end

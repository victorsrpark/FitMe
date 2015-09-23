//
//  Singleton.m
//  FitMe
//
//  Created by Donald Seo on 2015. 8. 30..
//  Copyright (c) 2015년 Donald Seo. All rights reserved.
//

#import "Singleton.h"

static Singleton* SingletonInstance = nil;

@implementation Singleton

@synthesize result;

+ (Singleton*)SingletonInstance
{
    if (!SingletonInstance){
        SingletonInstance = [[Singleton alloc] init];
    }
    return SingletonInstance;
}

-(id)init
{
    self = [super init];
    if (self){
        result = [[NSMutableArray alloc] init];
    }
    return self;
}


@end

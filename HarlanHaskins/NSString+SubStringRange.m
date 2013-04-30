//
//  NSString+SubStringRange.m
//  Field2Base
//
//  Created by Harlan Haskins on 4/13/13.
//  Copyright (c) 2013 Valley Rocket. All rights reserved.
//

#import "NSString+SubStringRange.h"

@implementation NSString (SubStringRange)

-(NSString*) substringFromIndex:(NSUInteger)from toIndex:(NSUInteger)to {
    NSRange range = {from, (to - from)};
    NSString *substring = [self substringWithRange:range];
    return substring;
}

@end

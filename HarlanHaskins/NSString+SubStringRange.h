//
//  NSString+SubStringRange.h
//  Field2Base
//
//  Created by Harlan Haskins on 4/13/13.
//  Copyright (c) 2013 Valley Rocket. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SubStringRange)
-(NSString*) substringFromIndex:(NSUInteger)from toIndex:(NSUInteger)to;
@end

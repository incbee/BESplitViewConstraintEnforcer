//
//  BESplitViewConstraintEnforcer.h
//
//  Copyright (c) 2013 Incredible Bee Ltd. Licensed under the BSD License.
//

#import <Foundation/Foundation.h>

@interface BESplitViewConstraintEnforcer : NSObject <NSSplitViewDelegate> {
    NSArray *minimumPaneWidths;
}

#pragma mark Initialization
- (id)initWithMinimumPaneWidths:(NSArray *)anArray;

@end

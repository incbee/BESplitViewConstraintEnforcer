//
//  BESplitViewConstraintEnforcer.h
//  Templates
//
//  Created by Philipp on 5/13/13.
//  Copyright (c) 2013 Dietmar Kerschner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BESplitViewConstraintEnforcer : NSObject <NSSplitViewDelegate> {
    NSArray *minimumPaneWidths;
}

#pragma mark Initialization
- (id)initWithMinimumPaneWidths:(NSArray *)anArray;

@end

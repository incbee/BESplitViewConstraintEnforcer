//
//  BESplitViewConstraintEnforcer.m
//  Templates
//
//  Created by Philipp on 5/13/13.
//  Copyright (c) 2013 Dietmar Kerschner. All rights reserved.
//

#import "BESplitViewConstraintEnforcer.h"

@implementation BESplitViewConstraintEnforcer

#pragma mark Initializion

- (id)initWithMinimumPaneWidths:(NSArray *)anArray {
    self = [super init];
    if (self) {
        minimumPaneWidths = [anArray retain];
    }
    return self;
}

- (void)dealloc {
    [minimumPaneWidths release];
    [super dealloc];
}

#pragma mark Split view delegate methods

- (CGFloat)splitView:(NSSplitView *)splitView constrainMinCoordinate:(CGFloat)proposedMin ofSubviewAt:(NSInteger)dividerIndex {
  // When the divider is dragged left only the pane immediately to the
  // divider's left is resized. So the way this works is that we first
  // calculate the width of all panes up to but *not* including that pane.
  CGFloat widthUpToSubview = 0;
  NSArray *subviews = [splitView subviews];
  for (NSUInteger i = 0; i < dividerIndex; i++) {
      NSView *pane = [subviews objectAtIndex:i];
      CGFloat paneWidth = [pane frame].size.width;
      widthUpToSubview += paneWidth;
  }

  // Now when we add the pane's minimum width we get the, in absolute terms,
  // the minimum width for the width constraints to be met.
  CGFloat minAllowedWidth = widthUpToSubview + [[minimumPaneWidths objectAtIndex:dividerIndex] floatValue];

  // Finally we accept the proposed width only if it doesn't undercut the
  // minimum allowed width
  return proposedMin < minAllowedWidth ? minAllowedWidth : proposedMin;
}

- (CGFloat)splitView:(NSSplitView *)splitView constrainMaxCoordinate:(CGFloat)proposedMax ofSubviewAt:(NSInteger)dividerIndex{

  // This works similar to how we work out the minimum constrained width. When
  // the divider is dragged right, only the pane immediately to the divider's
  // right is resized. Thus we first calculate the width consumed by all panes
  // after that pane.
  CGFloat widthDownToSubview = 0;
  NSArray *subviews = [splitView subviews];
  for (NSUInteger i = [subviews count] - 1; i > dividerIndex + 1; i--) {
      NSView *pane = [subviews objectAtIndex:i];
      CGFloat paneWidth = [pane frame].size.width;
      widthDownToSubview += paneWidth;
  }

  // Now when we add the pane's minimum width on top of the consumed width
  // after it, we get the maximum width allowed for the constraints to be met.
  // But we need a position from the left of the split view, so we translate
  // that by deducting it from the split view's total width.
  CGFloat splitViewWidth = [splitView frame].size.width;
  CGFloat minPaneWidth = [[minimumPaneWidths objectAtIndex:dividerIndex+1] floatValue];
  CGFloat maxAllowedWidth = splitViewWidth - (widthDownToSubview + minPaneWidth);

  // This is the converse of the minimum constraint method: accept the proposed
  // maximum only if it doesn't exced the maximum allowed width
  return proposedMax > maxAllowedWidth ? maxAllowedWidth : proposedMax;
}

@end

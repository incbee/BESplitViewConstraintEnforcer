BESplitViewConstraintEnforcer
=============================

Enforces minimum widths on an `NSSplitView`.


Usage
-----

Create a list of minimum pane widths, one per pane, from left to right. Then pass this list to the constraint enforcer and make it the split view's delegate:

    NSArray *minimumPaneWidths = [NSArray arrayWithObjects: @200.0f, @300.0f, @340.0f, nil];
    // assume defined in header
    splitViewConstraintEnforcer = [[BESplitViewConstraintEnforcer alloc] initWithMinimumPaneWidths:minimumPaneWidths];
    // assume defined and initialized elsewhere, for example as an outlet
    [splitView setDelegate:splitViewConstraintEnforcer];


Caveats
-------

Only works for split views with vertical dividers, that is, those with columns
arranged horizontally.

A split view maintains only a weak reference to its delegate. So if you set the
constraint enforcer as the delegate you need to ensure you hold a strong
reference to the enforcer. Otherwise you'll get some cryptic crashes.


License
-------

Copyright (c) 2013, Incredible Bee Ltd. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

- Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
- Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
- Neither the name of the Incredible Bee Ltd. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL INCREDIBLE BEE LTD. BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

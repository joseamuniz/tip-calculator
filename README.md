# Pre-work - *TipCalculator*

**TipCalculator** is a tip calculator application for iOS.

Submitted by: **Jose Muniz**

Time spent: **4** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] App uses current location to determine country and suggest appropriate tipping ranges.
- [X] App handles multiple input formats for the tip amount (e.g 18%, 18.0, 18.0%, etc)

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/l02SAKf.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** 

This is my first time using XCode and Swift. So far, XCode has had really good error messages with excellent auto-suggestions. Swift seems very similar to Scala, which is a programming language I use frequently. I've had XCode crash on me a few times!  

_Outlets_ and _Actions_ appear to be the way to link UI objects (view) with their code to handle them in the controller. 

- _Outlets_ are a handle on a UI object that is accessible in a controller. This handle can be used to programmatically change properties on these UI objects, such as their text.
- _Actions_ are methods within the controllers that can be associated with a some UI object event.

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** 

A strong reference cycle occurs when a chain of objects mutually depend on one another (i.e. hold a strong reference on each other) in a way that causes both not to be deallocated.

For example, if an object A depends (e.g. by having a field value) on an object B, and this object B refers back to A, then both will have a refCount > 0 even if both A and B are unreachable. 

In the specific case of closures, a closure can be thought of as an object. This object can refer back to other objects (if, inside the closure, those objects are being referenced). Therefore, if an object holds a reference to a closure, and this closure holds a reference back to the object, the same phenomenon will occur. 

## License

    Copyright 2017 Jose Muniz

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

//
// VTAcknowledgementViewController.h
//
// Copyright (c) 2013-2021 Vincent Tourraine (http://www.vtourraine.net)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#if __has_feature(modules)
@import UIKit;
#else
#import <UIKit/UIKit.h>
#endif

NS_ASSUME_NONNULL_BEGIN

/**
 `VTAcknowledgementViewController` is a subclass of `UIViewController` that displays a single acknowledgement.
 */
@interface VTAcknowledgementViewController : UIViewController

/// The main text view.
@property (nonatomic, weak, nullable) UITextView *textView;

/**
 Initializes an acknowledgement view controller with a title and a body text.

 @param title The acknowledgement title.
 @param text The acknowledgement body text.
 @param font The body font.

 @return A newly created `VTAcknowledgementViewController` instance.
 */
- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text font:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END

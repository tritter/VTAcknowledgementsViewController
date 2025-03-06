//
// VTAcknowledgementViewController.m
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

#import "VTAcknowledgementViewController.h"

@interface VTAcknowledgementViewController ()

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) UIFont *font;

@end

const CGFloat VTTopBottomDefaultMargin = 20;
const CGFloat VTLeftRightDefaultMargin = 10;


@implementation VTAcknowledgementViewController

- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text font:(UIFont *)font{
    self = [super init];

    if (self) {
        self.title = title;
        self.text = text;
        self.font = font;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UITextView *textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    if (self.font) {
        font = self.font;
    }
    textView.font = font;
    textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    textView.alwaysBounceVertical = YES;
#if !TARGET_OS_TV
    textView.editable = NO;
    textView.dataDetectorTypes = UIDataDetectorTypeLink;
#else
    // Allow scrolling on tvOS
    textView.userInteractionEnabled = YES;
    textView.selectable = YES;
    textView.panGestureRecognizer.allowedTouchTypes = @[@(UITouchTypeIndirect)];
#endif
    textView.textContainerInset = UIEdgeInsetsMake(VTTopBottomDefaultMargin, VTLeftRightDefaultMargin, VTTopBottomDefaultMargin, VTLeftRightDefaultMargin);
    [self.view addSubview:textView];

    self.textView = textView;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    [self updateTextViewInsets:self.textView];

    // Need to set the textView text after the layout is completed, so that the content inset and offset properties can be adjusted automatically.
    self.textView.text = self.text;
}

- (void)viewLayoutMarginsDidChange {
    [super viewLayoutMarginsDidChange];

    [self updateTextViewInsets:self.textView];
}

- (void)updateTextViewInsets:(UITextView *)textView {
    textView.textContainerInset = UIEdgeInsetsMake(VTTopBottomDefaultMargin, self.view.layoutMargins.left, VTTopBottomDefaultMargin, self.view.layoutMargins.right);
}

@end

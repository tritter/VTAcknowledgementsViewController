//
// ViewController.m
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

#import "ViewController.h"

#import <VTAcknowledgementsViewController.h>

@implementation ViewController

- (IBAction)pushAckViewControllerWithDefaultFileName:(id)sender {
    VTAcknowledgementsViewController *viewController = [VTAcknowledgementsViewController acknowledgementsViewController];
    viewController.rowFont = [UIFont boldSystemFontOfSize:12];
    viewController.licenseFont = [UIFont boldSystemFontOfSize:15];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)pushAckViewControllerWithExplicitFileName:(id)sender {
    VTAcknowledgementsViewController *viewController = [[VTAcknowledgementsViewController alloc] initWithFileNamed:@"Pods-VTAck App-acknowledgements"];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)pushAckViewControllerWithHardcodedData:(id)sender {
    VTAcknowledgement *ack = [[VTAcknowledgement alloc] initWithTitle:@"Test Title" text:@"Test content..." license:nil];
    VTAcknowledgementsViewController *viewController = [[VTAcknowledgementsViewController alloc] initWithAcknowledgements:@[ack]];
    viewController.headerText = @"Visit: https://developer.apple.com";
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)pushAckViewControllerWithPlainStyle:(id)sender {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Pods-VTAck App-acknowledgements" ofType:@"plist"];
    VTAcknowledgementsViewController *viewController = [[VTAcknowledgementsViewController alloc] initWithPath:path style:UITableViewStylePlain];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)pushAckViewControllerWithInsetGroupedStyle:(id)sender {
    if (@available(iOS 13.0, *)) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Pods-VTAck App-acknowledgements" ofType:@"plist"];
        VTAcknowledgementsViewController *viewController = [[VTAcknowledgementsViewController alloc] initWithPath:path style:UITableViewStyleInsetGrouped];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

@end

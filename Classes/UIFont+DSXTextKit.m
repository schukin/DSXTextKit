//
// UIFont+DSXTextKit.m
// DSXTextKit
//
// Copyright (c) 2014 Dave Schukin
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

#import "UIFont+DSXTextKit.h"

NSString * const DSXFontTextStyleHeadline       = @"DSXFontTextStyleHeadline";
NSString * const DSXFontTextStyleBody           = @"DSXFontTextStyleBody";
NSString * const DSXFontTextStyleSubheadline    = @"DSXFontTextStyleSubheadline";
NSString * const DSXFontTextStyleFootnote       = @"DSXFontTextStyleFootnote";
NSString * const DSXFontTextStyleCaption1       = @"DSXFontTextStyleCaption1";
NSString * const DSXFontTextStyleCaption2       = @"DSXFontTextStyleCaption2";

@implementation UIFont (DSXTextKit)

#pragma mark - Public methods

+ (instancetype)dsx_preferredFontForTextStyle:(NSString *)aTextStyle
{
    if ([self instancesRespondToSelector:@selector(preferredFontForTextStyle:)])
    {
        NSDictionary    *textStyleMappings  = [self textStyleMappings];
        NSString        *uiKitTextStyle     = textStyleMappings[aTextStyle];
        
        return [self preferredFontForTextStyle:uiKitTextStyle];
    }
    else
    {
        NSDictionary    *fontSizeMappings   = [self fontSizeMappings];
        NSNumber        *fontSizeBoxed      = fontSizeMappings[aTextStyle];
        CGFloat         fontSize            = [fontSizeBoxed floatValue];
        
        return [UIFont systemFontOfSize:fontSize];
    }
}

#pragma mark - Private methods

+ (NSDictionary *)textStyleMappings
{
    static NSDictionary *textStyleMappings;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        textStyleMappings = @{ DSXFontTextStyleHeadline       : UIFontTextStyleHeadline,
                               DSXFontTextStyleBody           : UIFontSymbolicTrait,
                               DSXFontTextStyleSubheadline    : UIFontTextStyleSubheadline,
                               DSXFontTextStyleFootnote       : UIFontTextStyleFootnote,
                               DSXFontTextStyleCaption1       : UIFontTextStyleCaption1,
                               DSXFontTextStyleCaption2       : UIFontTextStyleCaption2 };
    });
    
    return textStyleMappings;
}

+ (NSDictionary *)fontSizeMappings
{
    static NSDictionary *fontSizeMappings;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        fontSizeMappings = @{ DSXFontTextStyleHeadline      : @(17.0),
                              DSXFontTextStyleBody          : @(17.0),
                              DSXFontTextStyleSubheadline   : @(15.0),
                              DSXFontTextStyleFootnote      : @(13.0),
                              DSXFontTextStyleCaption1      : @(12.0),
                              DSXFontTextStyleCaption2      : @(11.0) };
    });
    
    return fontSizeMappings;
}

@end

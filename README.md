# DSXTextKit

Basic TextKit support pre-iOS 7. Yay.

## Usage
1. Install via CocoaPods

```
pod 'DSXTextKit'
```

2. Use new text styles:

```
extern NSString * const DSXFontTextStyleHeadline;
extern NSString * const DSXFontTextStyleBody;
extern NSString * const DSXFontTextStyleSubheadline;
extern NSString * const DSXFontTextStyleFootnote;
extern NSString * const DSXFontTextStyleCaption1;
extern NSString * const DSXFontTextStyleCaption2;
```

And new factory method:

``` objc
[UIFont dsx_preferredFontForTextStyle:DSXFontTextStyleHeadline];
```

3. Drop DSX namespacing when you drop iOS 6 support
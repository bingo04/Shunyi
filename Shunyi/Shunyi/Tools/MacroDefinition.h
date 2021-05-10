//
//  MacroDefinition.h
//  Shunyi
//
//  Created by macremote on 2021/4/12.
//

#ifndef MacroDefinition_h
#define MacroDefinition_h

#define isLogin @"isLogin"

#define CGG_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define CGG_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0

#define kTopHeight (kStatusBarHeight + kNavBarHeight)
#define kSafeHeight (kStatusBarHeight>20?34:0)
#define kTabBarHeight (kStatusBarHeight>20?83:49)
#define kVCHeight (SCREEN_HEIGHT-kTopHeight-kTabBarHeight)
#define kSafeVCHeight (kStatusBarHeight>20?(SCREEN_HEIGHT-kTopHeight-34):(SCREEN_HEIGHT-kTopHeight))

// 颜色, 传入十六进制整型数(长度为6位), 例如0x43b8a3
#define M18_COLOR_HEX(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:((c)&0xFF)/255.0  alpha:1.0]

#define IS_5_8_INCH_DEVICE (\
                            (CGRectGetWidth([UIScreen mainScreen].bounds) == 375.0f && \
                            CGRectGetHeight([UIScreen mainScreen].bounds) == 812.0f) \
                            || \
                            (CGRectGetWidth([UIScreen mainScreen].bounds) == 812.0f && \
                            CGRectGetHeight([UIScreen mainScreen].bounds) == 375.0f) \
                            )


#endif /* MacroDefinition_h */

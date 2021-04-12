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

// 颜色, 传入十六进制整型数(长度为6位), 例如0xF44336
#define M18_COLOR_HEX(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:((c)&0xFF)/255.0  alpha:1.0]


#endif /* MacroDefinition_h */

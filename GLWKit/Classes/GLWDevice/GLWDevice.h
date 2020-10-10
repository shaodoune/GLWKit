//
//  GLWDevice.h
//  GLWKit
//
//  Created by glw on 2020/9/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** 真机手机型号 */
typedef NS_ENUM(NSInteger, GLWDevicePlatformType){
    /** 未知类型 */
    GLWDevicePlatformType_Unknown = 0,

//模拟器-------------------------------------
    /** 模拟器 i386 */
    GLWDevicePlatformType_Simulator_i386,
    /** 模拟器 x86_64 */
    GLWDevicePlatformType_Simulator_x86_64,
    
//iPhone------------------------------------
    /** iPhone 2G */
    GLWDevicePlatformType_iPhone_2G,
    /** iPhone 3G */
    GLWDevicePlatformType_iPhone_3G,
    /** iPhone 3GS */
    GLWDevicePlatformType_iPhone_3GS,
    /** iPhone 4 */
    GLWDevicePlatformType_iPhone_4,
    /** iPhone 4S */
    GLWDevicePlatformType_iPhone_4S,
    /** iPhone 5 */
    GLWDevicePlatformType_iPhone_5,
    /** iPhone 5C */
    GLWDevicePlatformType_iPhone_5C,
    /** iPhone 5S */
    GLWDevicePlatformType_iPhone_5S,
    /** iPhone 6 */
    GLWDevicePlatformType_iPhone_6,
    /** iPhone 6 plus */
    GLWDevicePlatformType_iPhone_6_Plus,
    /** iPhone 6S */
    GLWDevicePlatformType_iPhone_6S,
    /** iPhone 6S Plus */
    GLWDevicePlatformType_iPhone_6S_Plus,
    /** iPhone SE */
    GLWDevicePlatformType_iPhone_SE,
    /** iPhone 7 */
    GLWDevicePlatformType_iPhone_7,
    /** iPhone 7 Plus */
    GLWDevicePlatformType_iPhone_7_Plus,
    /** iPhone 8 */
    GLWDevicePlatformType_iPhone_8,
    /** iPhone 8 Plus */
    GLWDevicePlatformType_iPhone_8_Plus,
    /** iPhone X */
    GLWDevicePlatformType_iPhone_X,
    /** iPhone XS */
    GLWDevicePlatformType_iPhone_XS,
    /** iPhone XS Max */
    GLWDevicePlatformType_iPhone_XS_Max,
    /** iPhone XR */
    GLWDevicePlatformType_iPhone_XR,
    /** iPhone 11 */
    GLWDevicePlatformType_iPhone_11,
    /** iPhone 11 Pro */
    GLWDevicePlatformType_iPhone_11_Pro,
    /** iPhone 11 Pro Max */
    GLWDevicePlatformType_iPhone_11_Pro_Max,
    
//iPod Touch---------------------------------
    /** iPod Touch 1G */
    GLWDevicePlatformType_iPod_Touch_1G,
    /** iPod Touch 2G */
    GLWDevicePlatformType_iPod_Touch_2G,
    /** iPod Touch 3G */
    GLWDevicePlatformType_iPod_Touch_3G,
    /** iPod Touch 4G */
    GLWDevicePlatformType_iPod_Touch_4G,
    /** iPod Touch 5G */
    GLWDevicePlatformType_iPod_Touch_5G,
    /** iPod Touch 6G */
    GLWDevicePlatformType_iPod_Touch_6G,
    
//iPad---------------------------------------
    /** iPad 1G */
    GLWDevicePlatformType_iPad_1G,
    /** iPad 2 */
    GLWDevicePlatformType_iPad_2,
    /** iPad 3 */
    GLWDevicePlatformType_iPad_3,
    /** iPad 4 */
    GLWDevicePlatformType_iPad_4,
    /** iPad 5 */
    GLWDevicePlatformType_iPad_5,
    /** iPad Air */
    GLWDevicePlatformType_iPad_Air,
    /** iPad Air 2 */
    GLWDevicePlatformType_iPad_Air_2,
    /** iPad Mini 1G */
    GLWDevicePlatformType_iPad_Mini_1G,
    /** iPad Mini 2G */
    GLWDevicePlatformType_iPad_Mini_2G,
    /** iPad Mini 3G */
    GLWDevicePlatformType_iPad_Mini_3G,
    /** iPad Mini 4G */
    GLWDevicePlatformType_iPad_Mini_4G,
    /** iPad Pro 9.7 inch */
    GLWDevicePlatformType_iPad_Pro_9_7_inch,
    /** iPad Pro 10.2 inch */
    GLWDevicePlatformType_iPad_Pro_10_2_inch,
    /** iPad Pro 10.5 inch */
    GLWDevicePlatformType_iPad_Pro_10_5_inch,
    /** iPad Pro 12.9 inch */
    GLWDevicePlatformType_iPad_Pro_12_9_inch,
    /** iPad Pro 12.9 inch 2 */
    GLWDevicePlatformType_iPad_Pro_12_9_inch_2,
};

@interface GLWDevice : NSObject



/** 是否为真机 */
+ (BOOL)isDevice;

/** 真机设备是否为iPhone */
+ (BOOL)isPhone;

+ (BOOL)isPhoneX;

/** 真机设备是否为iPad */
+ (BOOL)isPad;

@end

NS_ASSUME_NONNULL_END

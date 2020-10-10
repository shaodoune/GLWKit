//
//  GLWDevice.m
//  GLWKit
//
//  Created by glw on 2020/9/2.
//

//  最新的设备型号请参考地址：https://www.theiphonewiki.com/wiki/Models

#import "GLWDevice.h"
#import <sys/utsname.h>

@implementation GLWDevice

static NSString *glw_platform;
static GLWDevicePlatformType glw_platform_type;

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        struct utsname systemInfo;
        uname(&systemInfo);
        glw_platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
        
        //添加电量监听
        UIDevice *device = [UIDevice currentDevice];
        device.batteryMonitoringEnabled = YES;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceBatteryLevelDidChange:) name:UIDeviceBatteryLevelDidChangeNotification object:device];
    });
}

/**
 获取 bundle version版本号
 */
+(NSString*) getLocalAppVersion

{

    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];

}

/**
 获取BundleID
 */
+(NSString*) getBundleID

{

    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];

}

/**
 获取app的名字
 */
+(NSString*) getAppName

{

    NSString *appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];

    NSMutableString *mutableAppName = [NSMutableString stringWithString:appName];
    return mutableAppName;

}

/** 当前设备的型号 */
+ (NSString *)platform
{
    return glw_platform;
}

/** 是否为真机 */
+ (BOOL)isDevice
{
    if (glw_platform) {
        ///模拟器型号
        NSSet *simulatorsSet = [NSSet setWithObjects:@"x86_64", @"i386", nil];
        if (![simulatorsSet containsObject:glw_platform]) {
            return YES;
        }
    }
    return NO;
}

/** 真机设备是否为iPhone */
+ (BOOL)isPhone
{
    if ([self isDevice]) {
        return [glw_platform hasPrefix:@"iPhone"];
    }
    return NO;
}

+ (BOOL)isPhoneX
{
    if ([self isDevice]) {
        NSSet *platformSet = [NSSet setWithObjects:
                              /** iPhone X */
                              @"iPhone10,3",
                              @"iPhone10,6",
                              
                              /** iPhone XS */
                              @"iPhone11,2",
                              
                              /** iPhone XS Max */
                              @"iPhone11,4",
                              @"iPhone11,6",
                              
                              /** iPhonex XR */
                              @"iPhone11,8",
                              
                              
                              nil];
        if ([platformSet containsObject:glw_platform]) {
            return YES;
        }
    }
    return NO;
}

/** 真机设备是否为iPad */
+ (BOOL)isPad
{
    
    return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
//    if ([self isDevice]) {
//        return [glw_platform hasPrefix:@"iPad"];
//    }
//    return NO;
}

+(void)deviceBatteryLevelDidChange:(NSNotification *)notify {
    UIDevice *device = [UIDevice currentDevice];
    device.batteryMonitoringEnabled = YES;
    float batterLevel = [device batteryLevel];
    if (batterLevel <= 0.05 && batterLevel > 0) {
        
    }
    
}

/**
 通过设备信息获取设备的型号
 */
+(GLWDevicePlatformType)getPlatformOfDeviceByMachineInfo {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    GLWDevicePlatformType type;
    
//iPhone------------------------------------------------------------
    if ([platform isEqualToString:@"iPhone12,5"]){
        NSLog(@"iPhone 11 Pro Max");
        type = GLWDevicePlatformType_iPhone_11_Pro_Max;
    }

    if ([platform isEqualToString:@"iPhone12,3"]){
        NSLog(@"iPhone 11 Pro");
        type = GLWDevicePlatformType_iPhone_11_Pro;
    }

    if ([platform isEqualToString:@"iPhone12,1"]){
        NSLog(@"iPhone 11");
        type = GLWDevicePlatformType_iPhone_11;
    }

    if ([platform isEqualToString:@"iPhone11,8"]){
        NSLog(@"iPhone XR");
        type = GLWDevicePlatformType_iPhone_XR;
    }
    
    if ([platform isEqualToString:@"iPhone11,6"] ||
        [platform isEqualToString:@"iPhone11,4"]){
        NSLog(@"iPhone XS Max");
        type = GLWDevicePlatformType_iPhone_XS_Max;
    };
    
    if ([platform isEqualToString:@"iPhone11,2"]){
        NSLog(@"iPhone XS");
        type = GLWDevicePlatformType_iPhone_XS;
    }
    
    if ([platform isEqualToString:@"iPhone10,6"] ||
        [platform isEqualToString:@"iPhone10,3"]){
        NSLog(@"iPhone X");
        type = GLWDevicePlatformType_iPhone_X;
    }
    
    if ([platform isEqualToString:@"iPhone10,5"] ||
        [platform isEqualToString:@"iPhone10,2"]){
        NSLog(@"iPhone 8 Plus");
        type = GLWDevicePlatformType_iPhone_8_Plus;
    }
    
    if ([platform isEqualToString:@"iPhone10,4"] ||
        [platform isEqualToString:@"iPhone10,1"]){
        NSLog(@"iPhone 8");
        type = GLWDevicePlatformType_iPhone_8;
    }
    
    if ([platform isEqualToString:@"iPhone9,4"]){
        NSLog(@"iPhone 7 Plus (GSM)");
        type = GLWDevicePlatformType_iPhone_7_Plus;
    }
    
    if ([platform isEqualToString:@"iPhone9,3"]){
        NSLog(@"iPhone 7 (GSM)");
        type = GLWDevicePlatformType_iPhone_7;
    }
    
    if ([platform isEqualToString:@"iPhone9,2"]){
        NSLog(@"iPhone 7 Plus (CDMA)");
        type = GLWDevicePlatformType_iPhone_7_Plus;
    }
    
    if ([platform isEqualToString:@"iPhone9,1"]){
        NSLog(@"iPhone 7 (CDMA)");
        type = GLWDevicePlatformType_iPhone_7;
    }
    
    if ([platform isEqualToString:@"iPhone8,4"]){
        NSLog(@"iPhone SE");
        type = GLWDevicePlatformType_iPhone_SE;
    }
    
    if ([platform isEqualToString:@"iPhone8,2"]){
        NSLog(@"iPhone 6s Plus");
        type = GLWDevicePlatformType_iPhone_6_Plus;
    }
    
    if ([platform isEqualToString:@"iPhone8,1"]){
        NSLog(@"iPhone 6s");
        type = GLWDevicePlatformType_iPhone_6S;
    }
    
    if ([platform isEqualToString:@"iPhone7,2"]){
        NSLog(@"iPhone 6");
        type = GLWDevicePlatformType_iPhone_6;
    }
    
    if ([platform isEqualToString:@"iPhone7,1"]){
        NSLog(@"iPhone 6 Plus");
        type = GLWDevicePlatformType_iPhone_6_Plus;
    }
    
    if ([platform isEqualToString:@"iPhone6,2"] ||
        [platform isEqualToString:@"iPhone6,1"]){
        NSLog(@"iPhone 5s");
        type = GLWDevicePlatformType_iPhone_5S;
    }
    
    if ([platform isEqualToString:@"iPhone5,4"] ||
        [platform isEqualToString:@"iPhone5,3"]){
        NSLog(@"iPhone 5c");
        type = GLWDevicePlatformType_iPhone_5C;
    }
    
    if ([platform isEqualToString:@"iPhone5,2"] ||
        [platform isEqualToString:@"iPhone5,1"]){
        NSLog(@"iPhone 5");
        type = GLWDevicePlatformType_iPhone_5;
    }
    
    if ([platform isEqualToString:@"iPhone4,1"]){
        NSLog(@"iPhone 4S");
        type = GLWDevicePlatformType_iPhone_4S;
    }
    
    if ([platform isEqualToString:@"iPhone3,3"] ||
        [platform isEqualToString:@"iPhone3,2"] ||
        [platform isEqualToString:@"iPhone3,1"]){
        NSLog(@"iPhone 4");
        type = GLWDevicePlatformType_iPhone_4;
    }
    
    if ([platform isEqualToString:@"iPhone2,1"]){
        NSLog(@"iPhone 3GS");
        type = GLWDevicePlatformType_iPhone_3GS;
    }
    
    if ([platform isEqualToString:@"iPhone1,2"]){
        NSLog(@"iPhone 3G");
        type = GLWDevicePlatformType_iPhone_3G;
    }
    
    if ([platform isEqualToString:@"iPhone1,1"]){
        NSLog(@"iPhone 2G");
        type = GLWDevicePlatformType_iPhone_2G;
    }
    
//iPod------------------------------------------------------------
    if ([platform isEqualToString:@"iPod1,1"]){
        NSLog(@"iPod Touch 1G");
        type = GLWDevicePlatformType_iPod_Touch_1G;
    }

    if ([platform isEqualToString:@"iPod2,1"]){
        NSLog(@"iPod Touch 2G");
        type = GLWDevicePlatformType_iPod_Touch_2G;
    }

    if ([platform isEqualToString:@"iPod3,1"]){
        NSLog(@"iPod Touch 3G");
        type = GLWDevicePlatformType_iPod_Touch_3G;
    }

    if ([platform isEqualToString:@"iPod4,1"]){
        NSLog(@"iPod Touch 4G");
        type = GLWDevicePlatformType_iPod_Touch_4G;
    }

    if ([platform isEqualToString:@"iPod5,1"]){
        NSLog(@"iPod Touch 5G");
        type = GLWDevicePlatformType_iPod_Touch_5G;
    }
    
    if ([platform isEqualToString:@"iPod7,1"]){
        NSLog(@"iPod Touch 6G");
        type = GLWDevicePlatformType_iPod_Touch_6G;
    }
    
//iPad------------------------------------------------------------
    if ([platform isEqualToString:@"iPad1,1"] ||
        [platform isEqualToString:@"iPad1,2"]){
        NSLog(@"iPad 1G");
        type = GLWDevicePlatformType_iPad_1G;
    }

    if ([platform isEqualToString:@"iPad2,1"] ||
        [platform isEqualToString:@"iPad2,2"] ||
        [platform isEqualToString:@"iPad2,3"] ||
        [platform isEqualToString:@"iPad2,4"]){
        NSLog(@"iPad 2");
        type = GLWDevicePlatformType_iPad_2;
    }

    if ([platform isEqualToString:@"iPad3,1"] ||
        [platform isEqualToString:@"iPad3,2"] ||
        [platform isEqualToString:@"iPad3,3"]){
        NSLog(@"iPad 3");
        type = GLWDevicePlatformType_iPad_3;
    }

    if ([platform isEqualToString:@"iPad3,4"] ||
        [platform isEqualToString:@"iPad3,5"] ||
        [platform isEqualToString:@"iPad3,6"]){
        NSLog(@"iPad 4");
        type = GLWDevicePlatformType_iPad_4;
    }
    
    if ([platform isEqualToString:@"iPad6,11"] ||
        [platform isEqualToString:@"iPad6,12"]){
        NSLog(@"iPad 5");
        type = GLWDevicePlatformType_iPad_5;
    }
    
//iPad Pro------------------------------------------------------------
    if ([platform isEqualToString:@"iPad6,7"] ||
        [platform isEqualToString:@"iPad6,8"]){
        NSLog(@"iPad Pro 12.9-inch");
        type = GLWDevicePlatformType_iPad_Pro_12_9_inch;
    }
    
    if ([platform isEqualToString:@"iPad6,3"] ||
        [platform isEqualToString:@"iPad6,4"]){
        NSLog(@"iPad Pro 9.7-inch");
        type = GLWDevicePlatformType_iPad_Pro_9_7_inch;
    }
    
    if ([platform isEqualToString:@"iPad7,1"] ||
        [platform isEqualToString:@"iPad7,2"]){
        NSLog(@"iPad Pro 12.9-inch 2");
        type = GLWDevicePlatformType_iPad_Pro_12_9_inch_2;
    }
    
    if ([platform isEqualToString:@"iPad7,3"] ||
        [platform isEqualToString:@"iPad7,4"]){
        NSLog(@"iPad Pro 10.5-inch");
        type = GLWDevicePlatformType_iPad_Pro_10_5_inch;
    }

    if ([platform isEqualToString:@"iPad7,11"] ||
        [platform isEqualToString:@"iPad7,12"]){
        NSLog(@"iPad 10.2-inch");
        type = GLWDevicePlatformType_iPad_Pro_10_2_inch;
    }
    
//iPad Air------------------------------------------------------------
    if ([platform isEqualToString:@"iPad4,1"] ||
        [platform isEqualToString:@"iPad4,2"] ||
        [platform isEqualToString:@"iPad4,3"]){
        NSLog(@"iPad Air");
        type = GLWDevicePlatformType_iPad_Air;
    }
    
    if ([platform isEqualToString:@"iPad5,3"] ||
        [platform isEqualToString:@"iPad5,4"]){
        NSLog(@"iPad Air 2");
        type = GLWDevicePlatformType_iPad_Air_2;
    }
    
//iPad Mini------------------------------------------------------------
    if ([platform isEqualToString:@"iPad2,5"] ||
        [platform isEqualToString:@"iPad2,6"] ||
        [platform isEqualToString:@"iPad2,7"]){
        NSLog(@"iPad Mini 1G");
        type = GLWDevicePlatformType_iPad_Mini_1G;
    }

    if ([platform isEqualToString:@"iPad4,4"] ||
        [platform isEqualToString:@"iPad4,5"] ||
        [platform isEqualToString:@"iPad4,6"]){
        NSLog(@"iPad Mini 2G");
        type = GLWDevicePlatformType_iPad_Mini_2G;
    }
    
    if ([platform isEqualToString:@"iPad4,7"] ||
        [platform isEqualToString:@"iPad4,8"] ||
        [platform isEqualToString:@"iPad4,9"]){
        NSLog(@"iPad Mini 3G");
        type = GLWDevicePlatformType_iPad_Mini_3G;
    }
    
    if ([platform isEqualToString:@"iPad5,1"] ||
        [platform isEqualToString:@"iPad5,2"]){
        NSLog(@"iPad Mini 4G");
        type = GLWDevicePlatformType_iPad_Mini_4G;
    }
    
//Simulator------------------------------------------------------------
    if ([platform isEqualToString:@"i386"]){
        NSLog(@"iPhone Simulator");
        type = GLWDevicePlatformType_Simulator_i386;
    }

    if ([platform isEqualToString:@"x86_64"]){
        NSLog(@"iPhone Simulator");
        type = GLWDevicePlatformType_Simulator_x86_64;
    }
    return type;
}

/**
 通过设备的分辨率获取设备型号
 */
+(GLWDevicePlatformType)getPlatformOfDeviceByResolution{
    CGSize resolution = [UIScreen mainScreen].currentMode.size;
    
    
}

/// 可以利用 CGFloat a = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom；当a大于0时即是iPhone X ，XR，XS ，XS Max等。
#define isIphoneX ({\
BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
    if (!UIEdgeInsetsEqualToEdgeInsets([UIApplication sharedApplication].delegate.window.safeAreaInsets, UIEdgeInsetsZero)) {\
    isPhoneX = YES;\
    }\
}\
isPhoneX;\
})

/** **************** */

#define TotaliPhoneX (NAVIGATION_BAR_HEIGHT+HOME_INDICATOR_HEIGHT)


// 判断iPhoneX
// 判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhone11
#define IS_IPHONE_11 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

#define IS_IPHONE_11_Pro ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

#define IS_IPHONE_11_Pro_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)


#define Height_StatusBar ((iPhoneX == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES) ? 44.0 : 20.0)
#define Height_NavBar ((iPhoneX == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES) ? 88.0 : 64.0)
#define Height_TabBar ((iPhoneX == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES) ? 83.0 : 49.0)

//判断iPhoneX所有系列
#define IS_PhoneXAll (iPhoneX || IS_IPHONE_Xr || IS_IPHONE_Xs_Max || IS_IPHONE_Xs || IS_IPHONE_11 || IS_IPHONE_11_Pro || IS_IPHONE_11_Pro_Max)
// 状态栏高度
#define STATUS_BAR_HEIGHT ((iPhoneX == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES || IS_IPHONE_11 == YES || IS_IPHONE_11_Pro == YES || IS_IPHONE_11_Pro_Max == YES) ? 44.0 : 20.0)
// 导航栏高度
#define NAVIGATION_BAR_HEIGHT  ((iPhoneX == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES || IS_IPHONE_11 == YES || IS_IPHONE_11_Pro == YES || IS_IPHONE_11_Pro_Max == YES) ? 88.0 : 64.0)
// tabBar高度
#define TAB_BAR_HEIGHT ((iPhoneX == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES || IS_IPHONE_11 == YES || IS_IPHONE_11_Pro == YES || IS_IPHONE_11_Pro_Max == YES) ? 83.0 : 49.0)
// home indicator
#define HOME_INDICATOR_HEIGHT ((iPhoneX == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES || IS_IPHONE_11 == YES || IS_IPHONE_11_Pro == YES || IS_IPHONE_11_Pro_Max == YES) ? 34.0 : 0)

@end

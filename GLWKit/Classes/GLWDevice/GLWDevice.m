//
//  GLWDevice.m
//  GLWKit
//
//  Created by glw on 2020/9/2.
//

#import "GLWDevice.h"
#import <sys/utsname.h>

@implementation GLWDevice

static NSString *glw_platform;

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        struct utsname systemInfo;
        uname(&systemInfo);
        glw_platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    });
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
        NSSet *platformSet = [NSSet setWithObjects:@"iPhone10,3", @"iPhone10,6", @"iPhone11,2", @"iPhone11,4", @"iPhone11,6", @"iPhone11,8", nil];
        if ([platformSet containsObject:glw_platform]) {
            return YES;
        }
    }
    return NO;
}

/** 真机设备是否为iPad */
+ (BOOL)isPad
{
    if ([self isDevice]) {
        return [glw_platform hasPrefix:@"iPad"];
    }
    return NO;
}

@end

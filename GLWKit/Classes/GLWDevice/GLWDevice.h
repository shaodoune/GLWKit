//
//  GLWDevice.h
//  GLWKit
//
//  Created by glw on 2020/9/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

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

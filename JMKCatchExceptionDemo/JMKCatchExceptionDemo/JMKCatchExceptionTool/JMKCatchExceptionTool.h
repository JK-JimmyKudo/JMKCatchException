//
//  JMKCatchExceptionTool.h
//  JMKCatchExceptionDemo
//
//  Created by li on 2023/7/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMKCatchExceptionTool : NSObject

+ (instancetype)shareInstance;
//读取plist数据
- (NSArray*)readExceptionInfoFromLocal;
//初始化工具
- (void)installUncaughtExceptionHandler;
//清楚所有
- (void)clearAllLog;
//移除指定数据
- (void)removeExceptionItemIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END

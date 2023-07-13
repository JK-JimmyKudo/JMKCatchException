//
//  JMKExceptionBox.h
//  JMKCatchExceptionDemo
//
//  Created by li on 2023/7/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMKExceptionBox : NSObject<NSCopying>
@property(copy,nonatomic)NSString *name;
@property(copy,nonatomic)NSString *reason;
@property(copy,nonatomic)NSString *time;

@end

NS_ASSUME_NONNULL_END

//
//  JMKExceptionBox.m
//  JMKCatchExceptionDemo
//
//  Created by li on 2023/7/13.
//

#import "JMKExceptionBox.h"

@implementation JMKExceptionBox

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.reason forKey:@"reason"];
    [aCoder encodeObject:self.time forKey:@"time"];
}


- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.reason = [aDecoder decodeObjectForKey:@"reason"];
        self.time = [aDecoder decodeObjectForKey:@"time"];
    }
    return self;
}

//- (nonnull id)copyWithZone:(nullable NSZone *)zone {
//
//}

/**
声明了它可以处理本身实例的编码解码方式，以防止替换攻击
 */
+ (BOOL)supportsSecureCoding {
    return YES;
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return  [self copyWithZone:zone];
}

@end

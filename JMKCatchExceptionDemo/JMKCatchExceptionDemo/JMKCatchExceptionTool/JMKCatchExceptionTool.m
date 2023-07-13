//
//  JMKCatchExceptionTool.m
//  JMKCatchExceptionDemo
//
//  Created by li on 2023/7/13.
//

#import "JMKCatchExceptionTool.h"
#import "JMKExceptionBox.h"
@interface JMKCatchExceptionTool ()

@property(nonatomic,copy) NSString *filePath;

@end

@implementation JMKCatchExceptionTool

+ (instancetype)shareInstance{
    static JMKCatchExceptionTool *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JMKCatchExceptionTool alloc]init];
    });
    return instance;
}

-(void)installUncaughtExceptionHandler{
    _filePath = getFilePath();
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
}

- (NSArray*)readExceptionInfoFromLocal{
    //获取存储数据
    return [NSKeyedUnarchiver unarchiveObjectWithFile:_filePath];
}

- (void)clearAllLog{
    NSFileManager *manger = [NSFileManager defaultManager];
    NSString *filePath = _filePath;
    BOOL isExist = [manger fileExistsAtPath:filePath];
    if (isExist) {
        NSError __autoreleasing * error;
        [manger removeItemAtPath:filePath error:&error];
    }
}

- (void)removeExceptionItemIndex:(NSUInteger)index{
    NSMutableArray *dataArry = [self readExceptionInfoFromLocal].mutableCopy;
    [dataArry removeObjectAtIndex:index];
    //添加数据
    [NSKeyedArchiver archiveRootObject:dataArry toFile:_filePath];
}

//MARK:PRIVATE METHOD
NSDate * worldDateToLocalDate(NSDate *date){
    //获取本地时区(中国时区)
    NSTimeZone* localTimeZone = [NSTimeZone localTimeZone];
    //计算世界时间与本地时区的时间偏差值
    NSInteger offset          = [localTimeZone secondsFromGMTForDate:date];
    //世界时间＋偏差值 得出中国区时间
    NSDate *localDate         = [date dateByAddingTimeInterval:offset];
    return localDate;
}


#pragma mark - 获取crash文件名
NSString* getCurrentTime(){
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat       = @"yyyy-MM-dd:HH:mm:ss";
    fmt.timeZone         = [NSTimeZone timeZoneForSecondsFromGMT:8];
    NSDate *date         = [NSDate date];
    date                 = worldDateToLocalDate(date);
    NSString *dateString = [fmt stringFromDate:date];
    return dateString;
}




NSString* getFilePath(){
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"exception.plist"];
    return filePath;
}


void writeInfoToLocal(NSString *name,NSString *reason,NSString *time){
    JMKExceptionBox *exceptionBox = [JMKExceptionBox new];
    exceptionBox.name            = name;
    exceptionBox.reason          = reason;
    exceptionBox.time            = time;
    NSString *filePath           = getFilePath();
    NSFileManager *fileM         = [NSFileManager defaultManager];
    
    if (![fileM fileExistsAtPath:filePath]) {
        [fileM createFileAtPath:filePath contents:nil attributes:nil];
    }
    //获取存储数据
    NSMutableArray * chatLogArray =  [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"chatLogArray -- %@",chatLogArray);
    
    if ((chatLogArray.count == 0)) {
        chatLogArray = [NSMutableArray arrayWithCapacity:1];
    }
    [chatLogArray insertObject:exceptionBox atIndex:0];
    
    [NSKeyedArchiver archiveRootObject:chatLogArray toFile:filePath];
}


void UncaughtExceptionHandler(NSException *exception){
    NSString *reason     = [exception reason];
    NSString *name       = [exception name];
    NSString *timeString = getCurrentTime();
    writeInfoToLocal(name,reason,timeString);
}

@end

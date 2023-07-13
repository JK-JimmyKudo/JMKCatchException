//
//  ViewController.m
//  JMKCatchExceptionDemo
//
//  Created by li on 2023/7/13.
//

#import "ViewController.h"
static NSInteger const corlmax = 3;
static CGFloat const margin = 20;
//#define itemWH ([UIScreen mainScreen].bounds.size.width-(corlmax - 1) * margin) / corlmax
//#define itemW 200
#define itemW 200
#define itemH 50

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [uic];
    NSLog(@"viewDidLoad");
    NSArray *apps = @[@"Range",@"InvalidArgument",@"InternalInconsistency",@"malloc"];
    for (int i = 0; i < apps.count; i++) {
//         int row=i/corlmax;//所在行
//         int col=i%corlmax;//所在列
         //创建按钮
         UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
         btn.backgroundColor=[UIColor linkColor];
        CGFloat x= 100;//(itemWH+margin)*col;
        
         CGFloat y = 100 + (itemH+margin)*i;
        
        NSLog(@"y == %f",y);
        
        btn.frame=CGRectMake(x, y, itemW,  itemH);
        btn.tag = i;
        NSString *btnTitle = apps[i];
        [btn setTitle:btnTitle forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
         [self.view addSubview:btn];
        
     }
}

/**
*  监听按钮点击
 */
-(void)click:(UIButton *)btn
{
    NSLog(@"click");
    NSInteger index = btn.tag;
    switch (index) {
        case 0:
        {
            [self addArryException:btn];
        }
            break;
        case 1:
        {
            [self adddicException:btn];
        }
            break;
            
        case 2:
        {
            [self InternalInconsistencyException];

        }
            break;
        case 3:
        {
            [self mallocException];
        }
            break;
            
        default:
            break;
    }
}

- (void)addArryException:(id)sender {
    NSMutableArray * array = @[].mutableCopy;
    array[1] = @1;
}


- (void)adddicException:(id)sender {
    NSDictionary *dic = [NSDictionary dictionary];
    [dic setValue:nil forKey:@"prama"];
}

- (void)InternalInconsistencyException{
    NSDictionary *sampleDic = [NSDictionary dictionary];
    [sampleDic setValue:@"lala" forKey:@"prama"];
}

- (void)mallocException{
    NSMutableData *data = [[NSMutableData alloc] initWithCapacity:1];
    NSInteger len = 2032935142;
    [data increaseLengthBy:len];
}



@end

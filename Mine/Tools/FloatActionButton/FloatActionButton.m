//
//  BaseTools.m
//  Mine
//
//  Created by libin on 17/11/23.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//
#import "FloatActionButton.h"

@interface FloatActionButton()
{
    CGRect firstFrame;
}
@end

@implementation FloatActionButton


-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    firstFrame = frame;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(changePostion:)];
    [self addGestureRecognizer:pan];
    
    NSString *imageName = [[[[NSBundle mainBundle] infoDictionary]valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject];
    UIImage *iconImage = [UIImage imageNamed:imageName];
    [self setBackgroundImage:iconImage forState:UIControlStateNormal];

    
    self.alpha = 1;
    
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleDoubleTap:)];
    doubleTapGesture.numberOfTapsRequired =2;
    doubleTapGesture.numberOfTouchesRequired =1;
    [self addGestureRecognizer:doubleTapGesture];
    

    return self;
}

-(IBAction)buttonAction:(id)sender{
    if (self.floatBtnClickBlock) {
        self.floatBtnClickBlock();
    }
    
    CGRect frame = self.frame;
    CGPoint center = self.center;
    
    [UIView animateWithDuration:2 animations:^{
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width*1.5, frame.size.height*1.5);
        self.center = center;
    }];
}

- (IBAction)handleDoubleTap:(id)sender{
    CGPoint center = self.center;
    
    [UIView animateWithDuration:2 animations:^{
        self.frame = firstFrame;
        self.center = center;
    }];
}

-(void)changePostion:(UIPanGestureRecognizer *)pan
{
    //获取拖拽手势在self.view 的拖拽姿态
    CGPoint point = [pan translationInView:self];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGRect originalFrame = self.frame;
    //改变frame值
    originalFrame.origin.x += point.x;
    originalFrame.origin.y += point.y;
    
    //越界处理
    if (originalFrame.origin.x < 0) {
        originalFrame.origin.x = 0;
    }else if (originalFrame.origin.x > width - originalFrame.size.width){
        originalFrame.origin.x = width - originalFrame.size.width;
    }else if (originalFrame.origin.y < 0) {
        originalFrame.origin.y = 0;
    }else if (originalFrame.origin.y > height - originalFrame.size.height){
        originalFrame.origin.y =  height - originalFrame.size.height;
    }
    
    pan.view.frame = originalFrame;
    //    //重置拖拽手势的姿态
    [pan setTranslation:CGPointZero inView:self];
}


@end

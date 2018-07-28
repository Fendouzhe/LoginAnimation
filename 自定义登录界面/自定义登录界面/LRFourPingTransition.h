//
//  LRFourPingTransition.h
//  控制器专场动画集合
//
//  Created by apple on 16/6/12.
//  Copyright © 2016年 lurong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LRPresentOneTransitionType) {
    LRPresentOneTransitionTypePresent = 0,//管理present动画
    LRPresentOneTransitionTypeDismiss//管理dismiss动画
};

@interface LRFourPingTransition : NSObject<UIViewControllerAnimatedTransitioning,CAAnimationDelegate>

@property (nonatomic,assign) LRPresentOneTransitionType type;

+ (instancetype)transitionWithTransitionType:(LRPresentOneTransitionType)type;
- (instancetype)initWithTransitionType:(LRPresentOneTransitionType)type;

@end

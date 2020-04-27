//
//  AnimationView+Background.m
//  UIElements
//
//

//#import "AnimationView+Background.h"
//#import <objc/runtime.h>
//
//@implementation AnimationView (Background)
//
//+ (void)load{
//
//    Method oldPlayMethod = class_getInstanceMethod(self, @selector(play));
//    Method newPlayMethod = class_getInstanceMethod(self, @selector(sk_play));
//
//    method_exchangeImplementations(oldPlayMethod, newPlayMethod);
//
//    Method oldPauseMethod = class_getInstanceMethod(self, @selector(pause));
//    Method newPauseMethod = class_getInstanceMethod(self, @selector(sk_pause));
//
//    method_exchangeImplementations(oldPauseMethod, newPauseMethod);
//}
//
//- (void) sk_play {
//    if (self.isAnimationPlaying) {
//        return;
//    }
//    [self sk_play];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForegroud) name:UIApplicationWillEnterForegroundNotification object:nil];
//}
//
//- (void) sk_pause {
//    if (!self.isAnimationPlaying) {
//        return;
//    }
//    [self sk_pause];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
//}
//
//- (void) applicationWillEnterForegroud {
//    [self sk_play];
//}
//
//@end

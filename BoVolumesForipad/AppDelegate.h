//
//  AppDelegate.h
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/4/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


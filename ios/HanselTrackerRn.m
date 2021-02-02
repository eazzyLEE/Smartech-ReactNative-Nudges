//
//  HanselTrackerRn.m
//  AwesomeProject
//
//  Created by Rajeev Rajeshuni on 22/10/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "HanselTrackerRn.h"

@implementation HanselTrackerRn

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(getHanselData: (NSString* _Nonnull) eventName andVendor: (NSString* _Nonnull) vendor withProperties: (NSDictionary*_Nullable) properties callback:(RCTResponseSenderBlock)callback) {
    @try {
        [HanselRnUtils returnResult:[HanselTracker getHanselData:eventName andVendor:vendor withProperties:properties] withCallback:callback];
    } @catch (NSException *exception) {
        NSLog(@"Hansel error: Exception caught in getHanselData method in HanselTrackerRn bridge.");
    }
}

RCT_EXPORT_METHOD(isUsedInMap: (NSString* _Nonnull) event andVendor: (NSString* _Nonnull) vendor withProperties: (NSDictionary* _Nullable) properties callback:(RCTResponseSenderBlock)callback) {
    @try {
        [HanselRnUtils returnResult:[NSNumber numberWithBool:[HanselTracker isUsedInMap:event andVendor:vendor withProperties:properties]] withCallback:callback];
    } @catch (NSException *exception) {
        NSLog(@"Hansel error: Exception caught in isUsedInMap method in HanselTrackerRn bridge.");
    }
}

RCT_EXPORT_METHOD(logEvent: (NSString* _Nonnull) eventName andVendor: (NSString* _Nonnull) vendor withProperties: (NSDictionary* _Nullable) properties callback:(RCTResponseSenderBlock)callback) {
    @try {
        [HanselRnUtils returnResult:[HanselTracker logEvent:eventName andVendor:vendor withProperties:properties] withCallback:callback];
    } @catch (NSException *exception) {
        NSLog(@"Hansel error: Exception caught in logEvent method in HanselTrackerRn bridge.");
    }
}

RCT_EXPORT_METHOD(registerListener) {
    @try {
        [[HanselRnEventsListener sharedInstance] registerListener];
    } @catch (NSException *exception) {
        NSLog(@"Hansel error: Exception caught in registerListener method in HanselTrackerRn bridge.");
    }
}

RCT_EXPORT_METHOD(deRegisterListener) {
    @try {
        [[HanselRnEventsListener sharedInstance] deRegisterListener];
    } @catch (NSException *exception) {
        NSLog(@"Hansel error: Exception caught in deRegisterListener method in HanselTrackerRn bridge.");
    }
}

@end


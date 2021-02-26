#import "HanselRn.h"

@implementation HanselRn
{
    BOOL hasListeners;
}

RCT_EXPORT_MODULE();

- (void)startObserving {
    @try {
        hasListeners = YES;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sendEvent:) name:FIRE_EVENT_NOTIFICATION object:nil];
    } @catch (NSException *exception) {
        NSLog(@"Hansel error: Exception caught in startObserving method in HanselRn bridge.");
    }
}

- (void) stopObserving {
    @try {
        hasListeners = NO;
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    } @catch (NSException *exception) {
        NSLog(@"Hansel error: Exception caught in stopObserving method in HanselRn bridge.");
    }
}

- (NSArray<NSString *> *)supportedEvents {
    @try {
        return @[@"HanselRequestSynced",@"HanselActionPerformed",@"HanselInternalEvent"];
    } @catch (NSException *exception) {
        NSLog(@"Hansel error: Exception caught in supportedEvents method in HanselRn bridge.");
    }
}

RCT_EXPORT_METHOD(getInteractionMaps: (RCTResponseSenderBlock)callback) {
    @try {
        [HanselRnUtils returnResult:[Hansel getMaps] withCallback:callback];
    } @catch (NSException *exception) {
        NSLog(@"Hansel error: Exception caught in getMaps method in HanselRn bridge.");
    }
}

RCT_EXPORT_METHOD(setAppFont: (NSString* _Nonnull) fontFamily) {
    @try {
        [Hansel setAppFont:fontFamily];
    } @catch (NSException *exception) {
        NSLog(@"Hansel error: Exception caught in setAppFont method in HanselRn bridge.");
    }
}

RCT_EXPORT_METHOD(startRequestSyncEvents) {
    @try {
        [[HanselRnSyncStateListener sharedInstance] startSyncEvents];
    } @catch (NSException *exception) {
        NSLog(@"Hansel error: Exception caught in startRequestSSyncEvents method in HanselRn bridge.");
    }
}

RCT_EXPORT_METHOD(stopRequestSyncEvents) {
    @try {
        [[HanselRnSyncStateListener sharedInstance] stopSyncEvents];
    } @catch (NSException *exception) {
        NSLog(@"Hansel error: Exception caught in stopRequestSyncEvents method in HanselRn bridge.");
    }
}

RCT_EXPORT_METHOD(registerHanselActionListenerForAction: (NSString*) action) {
    @try {
        [[HanselRnActionListener sharedInstance] registerHanselActionListenerForAction:action];
    } @catch (NSException *exception) {
        NSLog(@"Hansel error: Exception caught in registerHanselActionListenerForAction method in HanselRn bridge.");
    }
}

RCT_EXPORT_METHOD(removeHanselActionListenerForAction: (NSString*) action) {
    @try {
        [[HanselRnActionListener sharedInstance] removeHanselActionListenerForAction:action];
    } @catch (NSException *exception) {
        NSLog(@"Hansel error: Exception caught in removeHanselActionListenerForAction method in HanselRn bridge.");
    }
}

RCT_EXPORT_METHOD(onSetScreen: (NSString*) screenName) {
    @try {
        dispatch_async(dispatch_get_main_queue(), ^{
            [Hansel setScreen:screenName];
        });
    } @catch (NSException *exception) {
        NSLog(@"Hansel error: Exception caught in setScreen method in HanselRn bridge.");
    }
}

RCT_EXPORT_METHOD(onUnsetScreen) {
    @try {
        dispatch_async(dispatch_get_main_queue(), ^{
            [Hansel unSetScreen];
        });
    } @catch (NSException *exception) {
        NSLog(@"Hansel error: Exception caught in unSetScreen method in HanselRn bridge.");
    }
}

RCT_EXPORT_METHOD(enableDebugLogs) {
    @try {
        [Hansel enableDebugLogs];
    } @catch (NSException *exception) {
        NSLog(@"Hansel error: Exception caught in enableDebugLogs method in HanselRn bridge.");
    }
}

RCT_EXPORT_METHOD(onBackButtonPressed: (RCTResponseSenderBlock)callback) {
    @try {
        dispatch_async(dispatch_get_main_queue(), ^{
            [HanselRnUtils returnResult:[NSNumber numberWithBool:[Hansel onBackButtonPressed]] withCallback:callback];
        });
    } @catch (NSException *exception) {
        NSLog(@"Hansel error: Exception caught in onBackButtonPressed method in HanselRn bridge.");
    }
}


- (void) sendEvent: (NSNotification*) notification {
    @try {
        if(hasListeners) {
            NSDictionary* userInfo = notification.userInfo;
            [self sendEventWithName:userInfo[NOTIFICATION_EVENT_NAME] body:userInfo[NOTIFICATION_BODY]];
        }
        
    } @catch (NSException *exception) {
        NSLog(@"Hansel error: Exception caught in sendEvent method in HanselRn bridge.");
    }
}


@end

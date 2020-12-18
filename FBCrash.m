//
//  FBCrash.m
//  BusinessDanmark
//
//  Created by Wiphu Jong Blaine on 10/23/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "FBCrash.h"
#import <Firebase.h>
#import <FirebaseCrashlytics.h>

@implementation FBCrash



RCT_EXPORT_MODULE();
/*
  Javascript
 FBCrash.getDeviceName( function(snap: any) {
     Alert.alert( snap )
 })
*/

RCT_EXPORT_METHOD(getDeviceName:(RCTResponseSenderBlock)callback){
  
  if ( [[FIRCrashlytics crashlytics] isCrashlyticsCollectionEnabled] == true ){
    NSLog(@"true : FIRCrashlytics");
    assert(NO);
  } else {
    NSLog(@"false : FIRCrashlytics");
  }

 @try{
   NSString *deviceName = [[UIDevice currentDevice] name];
   callback(@[[NSNull null], deviceName]);
 }
 @catch(NSException *exception){
   callback(@[exception.reason, @"ok"]);
 }
}


/*
  Javascript
  FBCrash.HelloWorld( 'Hello', 'Hello' )
 */
RCT_EXPORT_METHOD(HelloWorld:(NSString *)name location:(NSString *)location) {
  RCTLogInfo(@"HelloWorld %@ at %@", name, location);
}

/*
 FBCrash.HelloWorldCB( 'Hello', (text : string ) => {
     console.log( text );
 });
 */

RCT_EXPORT_METHOD(HelloWorldCB:(NSString *)name callback:(RCTResponseSenderBlock)cb){
  RCTLogInfo(@"HelloWorld -> %@", name);
  cb(@[ @"deviceName" ] );
}


@end

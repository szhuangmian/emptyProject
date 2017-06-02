//
//  Constant.h
//  EmptyProject
//
//  Created by HuangMian on 2017/2/28.
//  Copyright © 2017年 HuangMian. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

//#define TEST_SERVER

#ifdef TEST_SERVER
#define SERVER_URL          @"http://dev.xchuxing.com/"
#else
#define SERVER_URL          @"http://www.xchuxing.com/"
#endif


#define SCREEN_SCALE ([[UIScreen mainScreen] bounds].size.width / 320.f)
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height


#define IMAGE_WIDTH  304
#define IMAGE_HEIGHT 108
#define IMAGE_SCALE  (SCREEN_WIDTH-8.0*2)/304.0
#define ACTUAL_IAMGE_WIDTH  (304*IMAGE_SCALE)
#define ACTUAL_IMAGE_HEIGHT  (108*IMAGE_SCALE)



#define MainStroyBoard                 @"Main"
#define HomeStroyBoard                 @"Home"
#define FindStroyBoard                 @"Find"
#define UserStroyBoard                 @"User"


#define LOGIN_STATUS                   @"loginStatus"
#define USER_DATA                      @"userData"

#define VIEW_BACKGROUND 0xF2F1F1
#define VIEW_BACKGROUND_COLOR [UIColor colorWithHex:VIEW_BACKGROUND]

#define IS_IPHONE_4 fabs((double)[[UIScreen mainScreen] bounds].size.height) < 568.f
#define IS_IPHONE_5 (fabs((double)[[UIScreen mainScreen] bounds].size.height - 568.f) < DBL_EPSILON)
#define IS_IPHONE_6 (fabs((double)[[UIScreen mainScreen] bounds].size.height - 667.f) < DBL_EPSILON)
#define IS_IPHONE_6P (fabs((double)[[UIScreen mainScreen] bounds].size.height - 736.f) < DBL_EPSILON)
#define IS_IPAD (fabs((double)[[UIScreen mainScreen] bounds].size.height - 1024.f) < DBL_EPSILON)

#define iOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define iOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define iOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)


#ifdef DEBUG
#define debug(fmt, ...) NSLog(fmt, ##__VA_ARGS__);
#else
#define debug(...)
#endif

#endif /* Constant_h */

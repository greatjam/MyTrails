/*
 *  const.h
 *  CC
 *
 *  Created by  mac on 11-4-16.
 *  Copyright 2011 __MyCompanyName__. All rights reserved.
 *
 */

//typedef enum {
//    full,
//    nav,
//    nav_tab,
//    nav_tool
//} MainViewLayoutType;

#define STANDARD_CELL_HEIGHT 44
#define STANDARD_HEAD_WIDTH 50
#define STANDARD_EDGE_WIDTH 10
#define STANDARD_EDGE_HEIGHT 5
#define VIEW_HEIGHT_WITH_NAV_TAB 480-20-44-49
#define VIEW_HEIGHT_WITH_NAV_TOOL 480-20-44-44
#define VIEW_HEIGHT_WITH_NAV 480-20-44
#define VIEW_HEIGHT_NORMAL 480

#define STANDARD_TAB_HEIGHT 49



#ifdef DEBUG
#define DebugLog(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define DebugLog(format, ...)
#endif

//#ifdef DEBUG  
//#define DebugLog(log, ...) NSLog(log, ## __VA_ARGS__)  
//#undef DebugLog  
//#define DebugLog(log) NSLog(log)  
//#else  
//#define DebugLog(log, ...)  
//#undef DebugLog  
//#define DebugLog(log) NSLog(log)  
//#endif 

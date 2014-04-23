//
//  Constants.h
//  DevBy
//
//  Created by Admin on 4/9/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

typedef enum
{
    NewsSection = 0,
    EventsSection,
    JobsSection,
    CompaniesSection
} SectionTypes;

//#define IS_IPHONES (([[UIScreen mainScreen] bounds].size.height - 568)? NO: YES)
//#define IS_OS_6_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
//#define IS_OS_7_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#define CELL_CONTENT_WIDTH 320
#define CELL_CONTENT_MARGIN 10
#define CELL_CONTENT_MIN_HEIGHT 44
#define CELL_DETAIL_HEIGHT 20

#define FONT_CONTENT_SIZE 14
#define FONT_DETAIL_SIZE 12
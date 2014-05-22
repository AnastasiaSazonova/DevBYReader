//
//  Constants.h
//  DevBy
//
//  Created by Anastasia on 4/26/14.
//  Copyright (c) 2014 AD. All rights reserved.
//


#define NEWS @"Новости"
#define COMPANYS @"Компании"
#define JOB @"Вакансии"
#define EVENTS @"События"

#define NEWS_URL @"http://dev.by"
#define NEWS_XPATH @"//div[@class='lists-blogs']"
#define NEWS_CELL_XPATH @"//div[@class='blog-views-node item-body']"
#define NEWS_CELL_COMENTS_XPATH @"//div[@class='comments-list list-more']"


#define COMPANYS_URL @"http://companies.dev.by"
#define JOB_URL @"http://jobs.dev.by"
#define EVENTS_URL @"http://events.dev.by"

#define MOVE_RIGHT @"moveRight"
#define MOVE_LEFT @"moveLeft"

enum
{
    newsCells,
    posts,
    companies,
    vacancies,
    events
};

enum
{
    redColor,
    greenColor
};

enum
{
    companysDescription,
    companysDiscussion,
    companysFeedback
};

enum
{
    premiumType = 1,
    middleType,
    standardType
};

enum
{
    commentType,
    feedBackType
};

static const float offset = 20.0f;
static const float middleOffset = 15.0f;
static const float halfOffset = 10.0f;
static const float navBarHeight = 64.0f;

static const float ACImageHeight = 100;
static const float ACTitleLabelMaxLength = 110;
static const float ACTitleFont = 13;
static const float ACDateLabelFont = 11;

static const float MACTitleFont = 15;

static const float CCUsernameFont = 13;
static const float CCDateLabelFont = 11;
static const float CCCommentFont = 12;

static const float ECNameLabelFont = 14;
static const float ECDescriptionLabelFont = 12;
static const float ECDateLabelFont = 22;
static const float ECDayLabeFont = 17;
static const float ECWeekLabelFont = 17;

static const float PJCTitleFont = 16;
static const float PJCCompanysNameFont = 13;
static const float PJCDescriptionFont = 13;

static const float MJTitleFont = 16;
static const float MJCompanysNameFont = 13;

static const float FBCUsernameFont = 13;
static const float FBCLabelFont = 11;
static const float FBCTextFont = 12;

static const float DVNamelabelFont = 21;
static const float DVDatelabelFont = 15;

static const float CVCRowHeight = 40;
static const float CVCMaxCharsPerRow = 30;

static const float DCNameLabelFont = 28.0f;
static const float DCDescriptionLabelFont = 15.0f;
static const float DCEmployeeNumberFont = 13.0f;
static const float DCTextViewFont = 14.0f;
static const float DCLogoHeight = 45.0;

static const int DEMaxCharsForBigFont = 60;

static const int VCmaxCharsPerRow = 30;
static const int VCRowHeight = 40;
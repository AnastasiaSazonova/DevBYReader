//
//  EventRepository.m
//  DevBYReader
//
//  Created by Admin on 4/21/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "EventRepository.h"

@implementation EventRepository

- (NSArray *)getEventsList
{
    NSArray *eventsList = @[
                            [[EventModel alloc] initWithId:0 andTitle:@"Webinar: Модель ценообразования IT-проектов" andDate:@"21" andDateDet:@"апрель\nПН" andDescription:@"21 апреля 19:00 Минск."],
                            [[EventModel alloc] initWithId:0 andTitle:@"Как правильно составить резюме молодому специалисту" andDate:@"24" andDateDet:@"апрель\nЧТ" andDescription:@"24 апреля 14:00 Минск"],
                            [[EventModel alloc] initWithId:0 andTitle:@"Haskell Type System with Dzmitry Ivashnev" andDate:@"24" andDateDet:@"апрель\nЧТ" andDescription:@"24 апреля 19:00 Минск. Организатор: EPAM Systems"],
                            [[EventModel alloc] initWithId:0 andTitle:@"Belarus Startup 2014 - Финал" andDate:@"25" andDateDet:@"апрель\nЧТ" andDescription:@"25 апреля 16:00 Минск. Организатор: IT House"],
                            [[EventModel alloc] initWithId:0 andTitle:@"Phyton Meetup 25 апреля" andDate:@"25" andDateDet:@"апрель\nЧТ" andDescription:@"25 апреля 19:00 Минск."],
                            [[EventModel alloc] initWithId:0 andTitle:@"Лабораторная работа: Cocaine" andDate:@"26" andDateDet:@"апрель\nЧТ" andDescription:@"26-27 апреля 9:00 Минск."]
                          ];
    return eventsList;
}

- (EventDetailModel *)getEventDetailModel:(NSInteger)eventId_
{
    EventDetailModel *model = [[EventDetailModel alloc] init];
    
    switch (eventId_) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
            model.eventId = 0;
            model.title = @"Как правильно составить резюме молодому специалисту";
            model.time = @"24 апреля 14:00 Минск";
            model.listenersCount = 4;
            model.sponsorName = @"IT House";
            model.sponsorLogoAddress = @"NoName";
            model.sponsorInfo = @"IT House – центр развития высокотехнологичных проектов. Работает на базе Белорусского государственного университета, располагается в историческом центре Минска. Включает бизнес-акселератор, оказывающий полный спектр услуг по развитию it-стартапов.";
            model.email = @"webinars@returnonintelligence.com";
            model.siteAddress = @"http://www.exigenservices.ru/webinars/cv-for-young-specialist";
            model.phoneNumber = @"8(017)2095404";
            model.description = @"24 апреля 2014 г., в 14:00 (GMT+3, Minsk Time) состоится вебинар 'Как правильно составить резюме молодому специалисту'.Вебинар будет полезен студентам, ищущим стажировку, выпускникам и специалистам, которые впервые устраиваются на работу или впервые составляют резюме и также молодым специалистам.            План выступления            • Основные разделы резюме, структура            • Что стоит писать в резюме            • Типичные ошибки                       О докладчике            Дарья Лисица - закончила СПБГИЭУ.            В настоящее время – менеджер по подбору персонала в компании Return on Intelligence.            Для участия в вебинаре необходимо предварительно зарегистрироваться.";
            model.price = @"Бесплатно";
            model.address = @"Минск, Бровки 22";
            break;
    }
    return model;
}

@end

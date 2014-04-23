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

@end

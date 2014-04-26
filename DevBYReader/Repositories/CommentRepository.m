//
//  CommentRepository.m
//  DevBYReader
//
//  Created by Admin on 4/26/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "CommentRepository.h"

@implementation CommentRepository

- (NSArray *)getCommentsList
{
    NSArray *commentsList = @[
                            [Comment dataObjectWithAuthor:@"author1" andTime:@"14 апреля в 11:06" andText:@"Шесть парадигм программирования, которые изменят ваше представление о коде" andDepth:0],
                            [Comment dataObjectWithAuthor:@"author2" andTime:@"11 апреля в 15:26" andText:@"Михаил Дубаков рассказал и показал десятилетнюю историю TargetprocessМихаил Дубаков рассказал и показал десятилетнюю историю TargetprocessМихаил Дубаков рассказал и показал десятилетнюю историю Targetprocess" andDepth:0],
                            [Comment dataObjectWithAuthor:@"author3" andTime:@"10 апреля в 17:31" andText:@"Heartbleed – новое слово в маркетинге багов" andDepth:0],
                            [Comment dataObjectWithAuthor:@"author4" andTime:@"10 апреля в 16:44" andText:@"Злой гений создал гибрид '2048' и 'Flappy Bird' на погибель вашей продуктивности" andDepth:0],
                            [Comment dataObjectWithAuthor:@"Authors" andTime:@"07 апреля в 12:33" andText:@"Биография Gmail: подлинная история запуска гуглопочты, которой недавно исполнилось 10 лет"
                                       andDepth:0],
                            [Comment dataObjectWithAuthor:@"author6" andTime:@"09 апреля в 10:46" andText:@"Фотоотчет с IT Spring 2014: Люди, лего и город в лучах заката" andDepth:0],
                            [Comment dataObjectWithAuthor:@"author6" andTime:@"09 апреля в 10:46" andText:@"Фотоотчет с IT Spring 2014: Люди, лего и город в лучах заката" andDepth:0],
                            [Comment dataObjectWithAuthor:@"author66" andTime:@"09 апреля в 10:46" andText:@"Фотоотчет с IT Spring 2014: Люди, лего и город в лучах заката" andDepth:0],
                            [Comment dataObjectWithAuthor:@"author1" andTime:@"14 апреля в 11:06" andText:@"Шесть парадигм программирования, которые изменят ваше представление о коде" andDepth:0],
                            [Comment dataObjectWithAuthor:@"author2" andTime:@"11 апреля в 15:26" andText:@"Михаил Дубаков рассказал и показал десятилетнюю историю TargetprocessМихаил Дубаков рассказал и показал десятилетнюю историю TargetprocessМихаил Дубаков рассказал и показал десятилетнюю историю Targetprocess" andDepth:0],
                            [Comment dataObjectWithAuthor:@"xx" andTime:@"10 апреля в 17:31" andText:@"Heartbleed – новое слово в маркетинге багов"
                                          andDepth:0],
                            [Comment dataObjectWithAuthor:@"author6" andTime:@"09 апреля в 10:46" andText:@"Фотоотчет с IT Spring 2014: Люди, лего и город в лучах заката" andDepth:0],
                            [Comment dataObjectWithAuthor:@"author67" andTime:@"09 апреля в 10:46" andText:@"Фотоотчет с IT Spring 2014: Люди, лего и город в лучах заката" andDepth:0],
                            [Comment dataObjectWithAuthor:@"author67" andTime:@"09 апреля в 10:46" andText:@"Фотоотчет с IT Spring 2014: Люди, лего и город в лучах заката" andDepth:0]
                            ];
    return commentsList;
}

@end

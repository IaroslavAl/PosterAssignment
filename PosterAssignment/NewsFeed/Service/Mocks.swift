//
//  Mocks.swift
//  PosterAssignment
//
//  Created by BELDIN Yaroslav on 10.04.2025.
//

import Foundation

enum Mocks {
    static let standDigests: [Digest] = [
        .init(
            id: "1",
            image: "news",
            title: "Главные тренды технологий 2023",
            text: "Искусственный интеллект, метавселенные и квантовые вычисления — вот что будет определять развитие технологий в этом году."
        ),
        .init(
            id: "2",
            image: "news",
            title: "5 советов для улучшения сна",
            text: "Регулярный режим, отсутствие гаджетов перед сном и правильное питание помогут вам высыпаться и чувствовать себя лучше."
        ),
        .init(
            id: "3",
            image: "news",
            title: "Топ-5 мест для путешествий этой весной",
            text: "От цветущих садов Японии до солнечных пляжей Греции — куда отправиться, чтобы насладиться идеальным отдыхом."
        ),
        .init(
            id: "4",
            image: "news",
            title: "Книги, которые стоит прочитать",
            text: "Подборка лучших новинок литературы: от научной фантастики до мотивирующих биографий."
        ),
        .init(
            id: "5",
            image: "news",
            title: "Как сохранить деньги в условиях инфляции",
            text: "Советы экспертов по инвестициям и управлению личными финансами в нестабильной экономической ситуации."
        )
    ]

    static let standNews: [News] = [
        .init(
            id: "1",
            title: "Новый технологический прорыв",
            articlePreview: "Ученые совершили революционное открытие в области квантовых вычислений.",
            article: "Исследователи из ведущего университета объявили о создании квантового процессора, способного решать задачи, недоступные классическим компьютерам. Это открытие может изменить будущее технологий.",
            image: "news"
        ),
        .init(
            id: "2",
            title: "Запуск новой космической миссии",
            articlePreview: "NASA анонсировало миссию по исследованию Марса с помощью нового ровера.",
            article: "Агентство NASA планирует отправить на Марс новый ровер Perseverance 2.0, который займется поиском следов древней жизни и подготовкой к будущим пилотируемым миссиям.",
            image: "news"
        ),
        .init(
            id: "3",
            title: "Открытие нового вида животных",
            articlePreview: "Биологи обнаружили неизвестный ранее вид лягушек в тропических лесах Амазонки.",
            article: "Во время экспедиции в глубины амазонских джунглей ученые нашли новый вид лягушек с уникальным окрасом и необычным способом коммуникации. Открытие подчеркивает важность сохранения биоразнообразия.",
            image: "news"
        ),
        .init(
            id: "4",
            title: "Рекордные продажи смартфонов",
            articlePreview: "Компания Apple побила рекорд по продажам iPhone за последний квартал.",
            article: "Несмотря на глобальные экономические трудности, Apple сообщила о рекордных продажах iPhone 15, превысивших ожидания аналитиков. Основной рост пришелся на рынки Азии и Европы.",
            image: "news"
        ),
        .init(
            id: "5",
            title: "Изменения в экологическом законодательстве",
            articlePreview: "Евросоюз принял новые строгие нормы по сокращению выбросов углекислого газа.",
            article: "Согласно новому законодательству, к 2030 году все страны-члены ЕС должны сократить выбросы CO2 на 55% по сравнению с уровнем 1990 года. Это потребует значительных инвестиций в зеленые технологии.",
            image: "news"
        )
    ]
}

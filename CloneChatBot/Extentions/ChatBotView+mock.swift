//
//  ChatBotView+mock.swift
//  CloneChatBot
//
//  Created by Ilona Sellenberkova on 23/02/2023.
//

import Foundation

extension ChatbotViewModel {
    
    static let mock: ChatbotViewModel = ChatbotViewModel(
        database: chooseTranslationDB()
    )
}

func chooseTranslationDB() -> [Message] {
    var db: [Message] = [.init(id: "", contents: [""])]
    
    // Based on language assign right array of translations
    if let lang = Bundle.main.preferredLocalizations.first { // "en", "fr", "ru"
        switch lang {
        case "en":
            db = database1
        case "fr":
            db = database2
        default: // ru
            db = database3
        }
    }
    return db
}

var database1 = [
        //  Message(id: "0", contents: ["Make It Easy Chatbot 😉"], owner: .bot, options: [.init(key: "1", answer: "Hello!")]),
            Message(id: "1", contents: ["Nice to meet you."], options: [
                .init(key: "2", answer: "Nice to meet you too.")]),
            Message(id: "2", contents: ["Let me tell you more about Codice Fiscale..."], options: [.init(key: "3", answer: "Ok")]),
            
            Message(id: "3", contents: ["It's an Unique Identification Number used to pay your Tax and to receive access to a variety of other services.", "Do you want to know, more?"], options: [.init(key: "4", answer: "Oh, yeah.")]),
            
            Message(id: "4", contents: ["For instance: You can sign an employment contract or work as a freelancer. Pay Income Tax.", "Open bank account in Italy. Gain an access to Health Care System. Obtain an Italian mobile phone number.", "Sign contract for utility bills or Rent property for more than one month."], options: [.init(key: "5", answer: "Interesting")]),
            
            Message(id: "5", contents: ["How to obtain Codice Fiscale Certificate?"], options: [.init(key: "6", answer: "Go for it!")]),
            
            Message(id: "6", contents: ["You can go to any office of the Italian Revenue Agency to get Tax Code Certificate or book appointment online. \nWe will help you with it later, on."], options: [.init(key: "7", answer: "Let's continue.")]),

            Message(id: "7", contents: ["Now, let's talk about documents.", "First of all, are you European Citizen?"], options: [.init(key: "8", answer: "Yes"), .init(key: "9", answer: "No")]),
//          // 8.yes, 9. no
            Message(id: "8", contents: ["You need these documents:", "Passport & its copy, Confirmation of Study, Application for a Tax Code in Italian language"], options: [.init(key: "10", answer: "Take into account.")]),
                // yes
//          // NON-EU Citizen
            Message(id: "9", contents: ["You need these documents:", "Passport & copy, Confirmation of Study, Italian version of Form for Codice Fiscale, Visa & photo copy"], options: [.init(key: "10", answer: "Next, please!")]),
//
//           //FOR BOTH
            Message(id: "10", contents: ["Do you want to know what's next?"], options: [.init(key: "11", answer: "Yes, please.")]),
//            // for Yes

//            // To Download || show forms to download.
            Message(id: "11", contents: ["Related to the form for Tax Code.", "Click on button to download in your prefered language: EN, IT, ES, FR, DE"], options: [.init(key: "12", answer: "En"), .init(key: "12", answer: "It"), .init(key: "12", answer: "Es"), .init(key: "12", answer: "Fr"), .init(key: "12", answer: "De"), .init(key: "12", answer: "Skip")]),
            
            // Appointment - How do we redirect to the website?
            Message(id: "12", contents: ["Last but not least. \nHave you already booked your appointment?"], options: [.init(key: "13", answer: "Yes"), .init(key: "14", answer: "No")]),
            
            // yes - booked
            Message(id: "13", contents: ["Looks like, you are all set.", "Wish you a lot of luck."], options: [.init(key: "16", answer: "Thank you. Bye")]), // end of
                // yes
            
            //Bye - no
            Message(id: "14", contents: ["We'll help you with it to book that online."], options: [.init(key: "15", answer: "Ok")]), // without option there is empty button (placeholder)
            
            Message(id: "15", contents: ["Now you will be redirected to the website.", "Wish you a lot of luck!"], options: [.init(key: "16", answer: "👋 Redirect")]),
            // yes
            
            // END
            Message(id: "16", contents: ["End of Chat"], options: [])
        ]

var database2 = [
    //    Message(id: "0", contents: ["Make It Easy Chatbot 😉"], owner: .bot, options: [
    //        .init(key: "1", answer: "Salut")]),
    Message(id: "0", contents: ["Salut"], owner: .bot, options: [
        .init(key: "1", answer: "Salut")]),
    Message(id: "1", contents: ["Ravi de vous rencontrer."], options: [
        .init(key: "2", answer: "Réciproquement.")
    ]),
    Message(id: "2", contents: ["Laissez-moi vous en dire plus sur le code fiscal, le code des impôts"], options: [.init(key: "3", answer: "D'accord")]),
    
    Message(id: "3", contents: ["Il s'agit d'un numéro d'identification unique utilisé pour payer les impôts et accéder à une variété d'autres services.", "Voulez-vous en savoir plus?"], options: [.init(key: "4", answer: "Oui bien sûr.")]),
    
    Message(id: "4", contents: ["Par exemple: avec ce numéro, vous pouvez signer un contrat de travail ou travailler en tant qu'indépendant. Payer l'impôt sur le revenu.", "Ouvrir un compte bancaire en Italie. Accédez au système de santé. Obtenez un numéro de téléphone mobile italien. Signez un contrat de paiement des services publics ou de la location pour une période de plus d'un mois."], options: [.init(key: "5", answer: "Intéressant.")]),
    
    Message(id: "5", contents: ["Comment obtenir un code fiscal?"], options: [.init(key: "6", answer: "Loi!")]),
    
    Message(id: "6", contents: ["Vous devez vous rendre dans n'importe quel bureau de l'Agenzia delle Entrate pour obtenir une attestation du Cdice Fiscale, après avoir pris rendez-vous en ligne. Nous vous aiderons plus tard."], options: [.init(key: "7", answer: "Nous allons continuer.")]),

    Message(id: "7", contents: ["Parlons maintenant des documents.", "Tout d'abord, êtes-vous un citoyen européen?"], options: [.init(key: "8", answer: "Oui"), .init(key: "9", answer: "Non")]),
//          // 8.yes, 9. no
    Message(id: "8", contents: ["Vous aurez besoin des documents suivants: passeport, confirmation d'admission, demande de codiche fiscale en italien."], options: [.init(key: "10", answer: "Il est clair.")]),
        // yes
//          // NON-EU Citizen
    Message(id: "9", contents: ["Vous aurez besoin des documents suivants : passeport, attestation d'admission, demande de codice fiscale en italien, etc."], options: [.init(key: "10", answer: "Plus loin, s'il vous plait!")]),
        // no
//
//           //FOR BOTH
    Message(id: "10", contents: ["Voulez-vous savoir quelle est la prochaine étape?"], options: [.init(key: "11", answer: "Oui s'il te plaît.")]),
//            // for Yes
//
    // To Download || show forms to download.
    Message(id: "11", contents: ["Relatif au formulaire pour le code fiscal.", "Cliquez sur le bouton pour télécharger dans la langue de votre choix: En, It, Es, Fr, De"], options: [.init(key: "12", answer: "En"), .init(key: "12", answer: "It"), .init(key: "12", answer: "Es"), .init(key: "12", answer: "Fr"), .init(key: "12", answer: "De"), .init(key: "12", answer: "Sauter")]),
    
    // Appointment - How do we re-direct to the website?
    Message(id: "12", contents: ["Dernière question, mais néanmoins importante. Avez-vous déjà pris rendez-vous?"], options: [.init(key: "13", answer: "Oui"), .init(key: "14", answer: "Non")]),
    
    // yes - booked
    Message(id: "13", contents: ["Il semble que tout soit prêt. Bonne chance!"], options: [.init(key: "16", answer: "Merci salut.")]), // end of
        // yes
    
    //Bye - no
    Message(id: "14", contents: ["Nous vous aiderons à réserver votre date et votre heure en ligne."], options: [.init(key: "15", answer: "D'accord, merci")]), // without option there is empty button (placeholder)
    
    Message(id: "15", contents: ["Vous allez maintenant être redirigé vers le site Web de l'Agenzia delle Entrate.", "Bonne chance!"], options: [.init(key: "16", answer: "👋 Réorienter")]),
    // yes
    
    // END
    Message(id: "16", contents: ["Fin du chat"], options: [])
]

var database3 = [
    //    Message(id: "0", contents: ["Make It Easy Chatbot 😉"], options: [
    //    .init(key: "1", answer: "Привет")]),
    Message(id: "1", contents: ["Приятно познакомиться."], options: [
    .init(key: "2", answer: "Взаимно.")]),
    Message(id: "2", contents: ["Давай я раскажу тебе подробнее о кодиче фискале, налоговом коде"], options: [.init(key: "3", answer: "Окей")]),
    Message(id: "3", contents: ["Это уникальный идентификационный номер, используемый для уплаты налогов и получения доступа к множеству других услуг.", "Хочешь узнать больше?"], options: [.init(key: "4", answer: "Да, конечно.")]),
    
    Message(id: "4", contents: ["Например: с этим номером можно подписать трудовой договор или работать фрилансером. Оплатить подоходный налог. Открыть банковский счет в Италии. Получить доступ к системе здравоохранения. Получить итальянский номер мобильного телефона. Подписать договор на оплату коммунальных услуг или аренду имущества на срок более одного месяца."], options: [.init(key: "5", answer: "Интересно.")]),
    
    Message(id: "5", contents: ["Как получить кодиче фискале?"], options: [.init(key: "6", answer: "Действуй!")]),
    
    Message(id: "6", contents: ["Нужно обратиться в любой офис Agenzia delle Entrate, чтобы получить сертификат Сdice Fiscale, предварительно записавшись на прием онлайн. Мы поможем тебе с этим позже."], options: [.init(key: "7", answer: "Давай продолжим.")]),

    Message(id: "7", contents: ["Теперь поговорим о документах.", "Во-первых, ты гражданин Европы?"], options: [.init(key: "8", answer: "Да"), .init(key: "9", answer: "Нет")]),
//          // 8.yes, 9. no
    Message(id: "8", contents: ["Тебе потребуются следующие документы: паспорт, подтверждение о поступлении, заявление на получение кодиче фискале на итальянском языке."], options: [.init(key: "10", answer: "Понятно.")]),
        // yes
//          // NON-EU Citizen
    Message(id: "9", contents: ["Тебе потребуются следующие документы: паспорт, подтверждение о поступлении, заявление на получение кодичe фискале на итальянском языке и т. д."], options: [.init(key: "10", answer: "Дальше, пожалуйста!")]),
        // no
//
//           //FOR BOTH
    Message(id: "10", contents: ["Хочешь знать, что дальше?"], options: [.init(key: "11", answer: "Да, пожалуйста.")]),
//            // for Yes

    // To Download || show forms to download.
    Message(id: "11", contents: ["Относится к форме для Налогового кодекса.", "Нажмите на кнопку, чтобы скачать на предпочитаемом вами языке: En, It, Es, Fr, De"], options: [.init(key: "12", answer: "En"), .init(key: "12", answer: "It"), .init(key: "12", answer: "Es"), .init(key: "12", answer: "Fr"), .init(key: "12", answer: "De"), .init(key: "12", answer: "Пропускать")]),
    
    // Appointment - How do we redirect to the website?
    Message(id: "12", contents: ["Последний, но тем не менее важный вопрос. Ты уже записался на прием?"], options: [.init(key: "13", answer: "Да"), .init(key: "14", answer: "Нет")]),
    
    // yes - booked
    Message(id: "13", contents: ["Похоже, что всё готово. Желаю тебе удачи!"], options: [.init(key: "16", answer: "Спасибо, пока.")]), // end of
        // yes
    
    //Bye - no
    Message(id: "14", contents: ["Мы поможем тебе забронировать дату и время онлайн."], options: [.init(key: "15", answer: "Окей")]), // without option there is empty button (placeholder)
    
    Message(id: "15", contents: ["Сейчас ты будешь перенаправлен на сайт Agenzia delle Entrate.", "Желаю  удачи!"], options: [.init(key: "16", answer: "👋 Перенаправить")]),
    // yes
    
    // END
    Message(id: "16", contents: ["Конец чата"], options: [])
]



//static let mock: ChatbotViewModel = ChatbotViewModel(
//    messages: [
//        .init(id: "1", content: "Hello", owner: .bot, options: [
//            .init(key: "2", value: "Hi")
//        ])
//    ],
//    database: [
//        Message(content: "Hello", value: 1, options: ["Hi"]),
//        Message(content: "Nice to meet you.", value: 2, options: []),
//        // .init(id: "1", content: "Hello", owner: .bot, options: [.init(key: "2", value: "Hi")]),
//    ]
//)
//}


//database: [
//            .init(content: "Hello", value: 1, options: ["Hi"]),
//            // if the option isn't empty -> create .user Message;
//            // after that findmessage(message.value == 2) // by +1
//
////            val.2

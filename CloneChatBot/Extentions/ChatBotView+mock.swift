//
//  ChatBotView+mock.swift
//  CloneChatBot
//
//  Created by Ilona Sellenberkova on 23/02/2023.
//

import Foundation

extension ChatbotViewModel {
    
    static let mock: ChatbotViewModel = ChatbotViewModel(
        database: [
            Message(id: "1", contents: ["Nice to meet you."], options: [
                .init(key: "2", answer: "Nice to meet you too.")]),
            Message(id: "2", contents: ["Let me tell you more about Codice Fiscale..."], options: [.init(key: "3", answer: "Ok")]),
            
            Message(id: "3", contents: ["It's an Unique Identification Number used to pay your Tax and to receive access to a variety of other services.", "Do you want to know, more?"], options: [.init(key: "4", answer: "Oh, yeah.")]),
            
            Message(id: "4", contents: ["For instance: You can sign an employment contract or work as a freelancer. Pay Income Tax.", "Open bank account in Italy. Gain an access to Health Care System. Obtain an Italian mobile phone number.", "Sign contract for utility bills or Rent property for more than one month."], options: [.init(key: "5", answer: "Interesting")]),
            
            Message(id: "5", contents: ["How to obtain Codice Fiscale Certificate?"], options: [.init(key: "6", answer: "Go for it!")]),
            
            Message(id: "6", contents: ["You can go to any office of the Italian Revenue Agency to get Tax Code Certificate or book appointment online. We will help you with it later, on."], options: [.init(key: "7", answer: "Let's continue.")]),

            Message(id: "7", contents: ["Now, let's talk about documents.", "First of all, are you European Citizen?"], options: [.init(key: "8", answer: "Yes"), .init(key: "9", answer: "No")]),
//          // 8.yes, 9. no
            Message(id: "8", contents: ["You need these documents:", "Passport & its copy, Confirmation of Study, Application for a Tax Code in Italian language"], options: [.init(key: "10", answer: "Take into account.")]),
                // yes
//          // NON-EU Citizen
            Message(id: "9", contents: ["You need these documents:", "Passport & its copy, Confirmation of Study, Italian version of Form for Codice Fiscale, Visa & its photo copy"], options: [.init(key: "10", answer: "Next, please!")]),
                // no
//
//           //FOR BOTH
            Message(id: "10", contents: ["Do you want to know what's next?"], options: [.init(key: "11", answer: "Yes, please.")]),
//            // for Yes

//            // To Download || show forms to download.
            Message(id: "11", contents: ["Related to the form for Tax Code.", "Click on button to download in your preferred language: En, It, Es, Fr, De"], options: [.init(key: "12", answer: "En"), .init(key: "12", answer: "It"), .init(key: "12", answer: "Es"), .init(key: "12", answer: "Fr"), .init(key: "12", answer: "De"), .init(key: "12", answer: "Skip")]),
//
//
            // Appointment - How do we redirect to the website?
            Message(id: "12", contents: ["Last but not least. \nHave you already booked your appointment?"], options: [.init(key: "13", answer: "Yes"), .init(key: "14", answer: "No")]),
            
            // yes - booked
            Message(id: "13", contents: ["Looks like, you are all set.", "Wish you a lot of luck."], options: [.init(key: "16", answer: "Thank you. Bye")]), // end of
                // yes
            
            //Bye - no
            Message(id: "14", contents: ["We'll help you with it to book that online."], options: [.init(key: "15", answer: "Ok")]), // without option there is empty button (placeholder)
            
            Message(id: "15", contents: ["Now you will be redirected to the website.", "Wish you a lot of luck!"], options: [.init(key: "16", answer: "Thank you. Bye")]),
            // yes
            
            // END
            Message(id: "16", contents: ["End of Chat"], options: [])
        ]
    )
}


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

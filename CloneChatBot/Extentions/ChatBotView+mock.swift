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
            Message(id: "11", contents: ["Related to the form for Tax Code.", "Click on button to download in your prefered language: En, It, Es, Fr, De"], options: [.init(key: "12", answer: "En"), .init(key: "12", answer: "It"), .init(key: "12", answer: "Es"), .init(key: "12", answer: "Fr"), .init(key: "12", answer: "De"), .init(key: "12", answer: "Skip")]),
//
//
            // Appointment - How do we redirect to the website?
            Message(id: "12", contents: ["Last but not least. Have you already booked your appointment?"], options: [.init(key: "13", answer: "Yes"), .init(key: "14", answer: "No")]),
            
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
//        database: [
//            .init(content: "Hello", value: 1, options: ["Hi"]),
//            // if the option isn't empty -> create .user Message;
//            // after that findmessage(message.value == 2) // by +1
//
////            val.2
//                .init(content: "Nice to meet you.", value: 2, options: ["Nice to meet you too"]),
//            //create message .user Message
//           // after that findmessage(message.value == 3)
//
////            val. 3
//                .init(content: "Let me tell you more about Tax Code (Codice Fiscale):", value: 3, options: ["Ok"]),
//            //create message .user Message
//           // after that findmessage(message.value == 4)
//
////            val. 4
//                .init(content: "It's an unique identification number to be able to pay your tax and receive access to a variety of services. Do you want to know, more?", value: 4, options: ["yes"]),
//            //create message .user Message
//           // after that findmessage(message.value == 5)
//
////            val. 5
//                .init(content: "For instance: Sign an employment contract or work as a freelancer. Pay Income Tax. Open bank account in Italy. Gain an access to, Health Care System. Obtain an Italian mobile phone number. Sign contract for utility bills. Rent property for more than one month.", value: 5, options: ["Interesting..."]),
//            //create message .user Message
//           // after that findmessage(message.value == 6)
//
////            val. 6
//                .init(content: "How to obtain Codice Fiscale Certificate?", value: 6, options: ["Go for it!"]),
//            //create message .user Message
//           // after that findMessage(value: Int) -> Int {
////              if message.options.count > 2 {
////            var nextMessage = message.value += 2
////            }
////            }
//
////            val. 7
//                .init(content: "You can go to any office of the Italian Revenue Agency to get Tax Code Certificate or book appointment online. We will help you with it later, on.", value: 7, options: []),
//            // after that findmessage(message.value == 8)
//
//
//            // Dowloand forms
//            // Question are you ready -> doesn't matter of answer or... Just to click to trigger following question'
//            // 1. Click once you are ready to walk you through the process.
//            // 2. If you want download the required... - instead do you want yes/no
//
////            val. 8
//            Message(content: "Now, let's talk about documents. First of all, are you European Citizen?", value: 8, options: ["yes", "no"]),
//            //create message .user Message
//            // after that findmessage(message.value == 9)
//
//            // 9.yes, 11. no
////            var nextMessageIs: Int
////            if message.options.count > 1 {
////                nextMessageIs = message.value + 1
////            } else {
////                nextMessageIs = message.value + 2
////            }
//
////            val. 9
//                .init(content: "You need these documents: *Passport, *Confirmation of Study, *Italian version of Form for Codice Fiscale", value: 9, options: []),
//            // after that findmessage(message.value == 11)  !!!
//            // yes
//
////           val. 10     // NON-EU Citizen
//                .init(content: "Non-EU (info for me:) You need these documents: Passport, Confirmation of Study, Italian version of Form for Codice, Fiscale, What ever non-eu students needs", value: 10, options: []),
//            // after that findmessage(message.value == 11)  !!!
//            // for no
//
//
//
//
////          val. 11                //FOR BOTH
//                .init(content: "Do you want to know what's next?", value: 11, options: ["yes"]),
//            //create message .user Message
//            // after that findmessage(message.value == 1)
//
//            // for Yes
//
//
////            INSTEAD ANOTHER TREE - WE SAY: if you don't have the form yet. Click and download.'
//
//
////            val. 12                            // FORM 12-13, 12-14 (for both)
//                .init(content: "Related to the form to get Tax Code. Have you filled yours already?", value: 12, options: ["yes", "no"]),
//            //create message .user Message
//            // after that findmessage(message.value == 1) // yes -> 13, no -> 14
//            // yes
//
//
////            val. 13
//                .init(content: "You're smart Cookie.", value: 13, options: []),
//            // yes -> bye
//
////            If NO
////            val. 14       // To Download || show forms to download.
//                .init(content: "Choose your prefered language/s:", value: 14, options: ["en", "it", "es", "fr", "de"]),
//            //create message .user Message
//            // after that findmessage(message.value == 1)
//
////            Continue
////            val. 15
//            // Appointment - How do we redirect to the website?
//                .init(content: "Last but not least. Do you arrange your appointment?", value: 15, options: ["yes", "no"]),
//            //create message .user Message
//            // after that findmessage(message.value == 1)
//            // yes,no
//
////            val. 16      //Bye - yes
//                .init(content: "Looks like, you are set. Wish you a lot of luck.", value: 16, options: ["Thank you. Bye"]),
//            //create message .user Message
//            // after that findmessage(message.value == 1)
//
////            val. 17       //Bye - no
//                .init(content: "Now you will be redirected to the website. Wish you a lot of luck.", value: 17, options: ["Thank you. Bye"]),
//            // no
//            //create message .user Message
//
//
//
//
//
//            //
//            //            .init(id: "1", content: "Hello", owner: .bot, options: [.init(key: "2", value: "Hi")]),
//            //
//            //            .init(id: "2", answerId: "3", content: "Hi 2", owner: .user),
//            //
//            //            .init(id: "3", content: "Appointment", owner: .bot, options: [.init(key: "4", value: "yes"), .init(key: "6", value: "no")]),
//            //            .init(id: "4", answerId: "5", content: "Yes", owner: .user),
//            //            .init(id: "5", content: "Form", owner: .bot),
//            //            .init(id: "6", answerId: "7", content: "No", owner: .user),
//            //            .init(id: "7", content: "Help", owner: .bot, options: [.init(key: "8", value: "Sure")]),
//            //            .init(id: "8", content: "Sure", owner: .user, options: [.init(key: "8", value: "End")])
//        ]
    )
}

//
//static let mock: ChatbotViewModel = ChatbotViewModel(
//    messages: [
//        .init(id: "1", content: "Hello", owner: .bot, options: [
//            .init(key: "2", value: "Hi"),
//            .init(key: "10", value: "Hi 2"),
//            .init(key: "11", value: "Hi 3")
//        ])
//    ],
//    database: [
//        Message(content: "Hello", value: 1, options: ["Hi"]),
//        Message(content: "Nice to meet you.", value: 2, options: []),
//        Message(content: "Let me tell you more about Tax Code (Codice Fiscale):", value: 3, options: ["Ok"]),
//        Message(content: "It's an unique identification number to be able to pay your tax and receive access to a variety of services. Do you want to know, more?", value: 4, options: ["yes"]),
//        Message(content: "For instance: Sign an employment contract or work as a freelancer. Pay Income Tax. Open bank account in Italy. Gain an access to, Health Care System. Obtain an Italian mobile phone number. Sign contract for utility bills. Rent property for more than one month.", value: 5, options: ["Interesting"]),
//        Message(content: "How to obtain Codice Fiscale Certificate?", value: 6, options: ["Go for it"]),
//        Message(content: "You can go to any office of the Italian Revenue Agency to get Tax Code Certificate or book appointment online. We will help you with it later, on.", value: 7, options: []),
//        // Dowloand forms
//        // Question are you ready -> doesn't matter of answer or... Just to click to trigger following question'
//        // 1. Click once you are ready to walk you through the process.
//        // 2. If you want download the required... - instead do you want yes/no
//
//        //Let's talk about documents. First of all, are you EU-Citizen?
//        Message(content: "Tell me. Are you European Citizen?", value: 8, options: ["yes", "no"]),
//        // 9.yes, 11. no
//
//        Message(content: "You need these documents: *Passport, *Confirmation of Study, *Italian version of Form for Codice Fiscale", value: 9, options: []),
//        // yes
//
//        //FOR BOTH
//        Message(content: "Do you want to know what's next?", value: 10, options: ["yes"]),
//        // for Yes
//
//        // NON-EU Citizen
//        Message(content: "Non-EU (info for me:) You need these documents:", value: 11, options: ["Passport", "Confirmation of Study", "Italian version of Form for Codice, Fiscale", "What ever non-eu students needs"]),
//        // for yes
//
//        // JUMP into message10 repeat Message(content: "Do you want to know what's next?", value: 10, options: ["yes", "no"]), // for Yes,
//
//        // FORM 12-13, 12-14 (for both)
//        Message(content: "Related to the form for Tax Code. Have you filled your form?", value: 12, options: ["yes"]),
//        // yes 13
//
//        Message(content: "You're smart Cookie.", value: 13, options: []),
//        // yes -> bye
//
//
//        // To Download || show forms to download.
//        Message(content: "Choose your prefered language/s:", value: 14, options: ["en", "it", "es", "fr", "de"]),
//
//
//        // Appointment - How do we redirect to the website?
//        Message(content: "Last but not least. Do you already have your appointment?", value: 15, options: ["yes", "no"]),
//        // yes,no
//
//        //Bye - yes
//        Message(content: "Now you will be redirected to the website. Wish you a lot of luck.", value: 14, options: ["Thank you. Bye"]),
//        // yes
//
//
//        //Bye - no
//        Message(content: "Looks like, you are set. Wish you a lot of luck.", value: 14, options: ["Thank you. Bye"]),
//
//
//
//        //
//        //            .init(id: "1", content: "Hello", owner: .bot, options: [.init(key: "2", value: "Hi")]),
//        //
//        //            .init(id: "2", answerId: "3", content: "Hi 2", owner: .user),
//        //
//        //            .init(id: "3", content: "Appointment", owner: .bot, options: [.init(key: "4", value: "yes"), .init(key: "6", value: "no")]),
//        //            .init(id: "4", answerId: "5", content: "Yes", owner: .user),
//        //            .init(id: "5", content: "Form", owner: .bot),
//        //            .init(id: "6", answerId: "7", content: "No", owner: .user),
//        //            .init(id: "7", content: "Help", owner: .bot, options: [.init(key: "8", value: "Sure")]),
//        //            .init(id: "8", content: "Sure", owner: .user, options: [.init(key: "8", value: "End")])
//    ]
//)
//}

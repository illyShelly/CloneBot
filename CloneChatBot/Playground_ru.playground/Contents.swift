import UIKit

var greeting = "Hello, playground"


import UIKit

enum Owner: String, Equatable {
    case bot
    case user
}

struct Reply: Hashable {
    var key: String
    var answer: String
}

//struct Option: Hashable { // previous MC3 repo struct
//    var key: String
//    var value: String
//}

struct Message {
    var id: String = ""
    var contents: [String] = []
    var options: [Reply] = []
    
    init(id: String = "\(UUID())", contents: [String], options: [Reply] = []) {
        self.id = id
        self.contents = contents
        self.options = options
    }
    
}


var database = [
            Message(id: "0", contents: ["Привет"], options: [
                .init(key: "1", answer: "Привет")]),
            Message(id: "1", contents: ["Приятно познакомиться."], options: [
                .init(key: "2", answer: "Взаимно.")]),
            Message(id: "2", contents: ["Давай я раскажу тебе подробнее о кодиче фискале, налоговом коде"], options: [.init(key: "3", answer: "Окей")]),
            
            Message(id: "3", contents: ["Это уникальный идентификационный номер, используемый для уплаты налогов и получения доступа к множеству других услуг. \nХочешь узнать больше?"], options: [.init(key: "4", answer: "Да, конечно.")]),
            
            Message(id: "4", contents: ["Например: с этим номером можно подписать трудовой договор или работать фрилансером. Оплатить подоходный налог. Открыть банковский счет в Италии. Получить доступ к системе здравоохранения. Получить итальянский номер мобильного телефона. Подписать договор на оплату коммунальных услуг или аренду имущества на срок более одного месяца."], options: [.init(key: "5", answer: "Интересно.")]),
            
            Message(id: "5", contents: ["Как получить кодиче фискале?"], options: [.init(key: "6", answer: "Действуй!")]),
            
            Message(id: "6", contents: ["Нужно обратиться в любой офис Agenzia delle Entrate, чтобы получить сертификат Сdice Fiscale, предварительно записавшись на прием онлайн. Мы поможем тебе с этим позже."], options: [.init(key: "7", answer: "Давай продолжим.")]),

            Message(id: "7", contents: ["Теперь поговорим о документах. Во-первых, ты гражданин Европы?"], options: [.init(key: "8", answer: "Да"), .init(key: "9", answer: "Нет")]),
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

            // Appointment - How do we redirect to the website?
            Message(id: "11", contents: ["Последний, но тем не менее важный вопрос. Ты уже записался на прием?"], options: [.init(key: "12", answer: "Да"), .init(key: "13", answer: "Нет")]),
            
            // yes - booked
            Message(id: "12", contents: ["Похоже, что всё готово. Желаю тебе удачи!"], options: [.init(key: "15", answer: "Спасибо, пока.")]), // end of
                // yes
            
            //Bye - no
            Message(id: "13", contents: ["Мы поможем тебе забронировать дату и время онлайн."], options: [.init(key: "14", answer: "Окей")]), // without option there is empty button (placeholder)
            Message(id: "14", contents: ["Сейчас ты будешь перенаправлен на сайт Agenzia delle Entrate. Желаю  удачи!"], options: [.init(key: "15", answer: "Спасибо, пока!")]),
            // yes
            
            // END
            Message(id: "15", contents: ["Конец чата"], options: [])
        ]


print(database[1].contents.first)

//
//  ChatbotViewModel.swift
//  CloneChatBot
//
//  Created by Ilona Sellenberkova on 02/03/2023.
//

import Foundation

enum Sender {
    case bot
    case user
}
    
struct Bubble: Identifiable {
    var id: String = "\(UUID())"
    var info: String
    var who: Sender = .bot
}

class ChatbotViewModel: ObservableObject {
    @Published var database: [Message] // declare var
    @Published var bubbles: [Bubble] = [Bubble(info: "Welcome, Bro, we are here to help you.")]
    @Published var currentMessage: Message = Message(id: "0", contents: ["Welcome To Our Chatbot"], owner: .bot, options: [.init(key: "1", answer: "Hello!")])
    
//    @Published var userChoice: String = ""
    
    // The same as: var database: [Message] = []
    init(database: [Message] = []) { // init as empty arr
        self.database = database
    }
    
    func getNextMessage(choice: String) -> Message {
        var nextMessage: Message = .init(id: "", contents: [""])
        
        // database.first(where: { $0.id == message.id })
        for message in database {
            if message.id == choice {
                nextMessage = message
            }
        }
        return nextMessage
    }
    
    //    Post message as .bot or as .user
    func postMessage(message: String, sender: Sender) {
        self.bubbles.append(Bubble(info: message, who: sender)) // self keyword when moving into VM
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                // Create bubble/s related to current message content
            for note in self.currentMessage.contents {
                self.bubbles.append(Bubble(info: note, who: .bot))
                }
        }
    }
}

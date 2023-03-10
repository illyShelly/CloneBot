//
//  ChatbotViewModel.swift
//  CloneChatBot
//
//  Created by Ilona Sellenberkova on 02/03/2023.
//

import Foundation


class ChatbotViewModel: ObservableObject {
    @Published var database: [Message] // declare var
    @Published var bubbles: [Bubble] = [] // [Bubble(info: "Make It Easy Chatbot 😉")]
    @Published var currentMessage: Message = Message(id: "0", contents: ["😉"], owner: .bot, options: [.init(key: "1", answer: "Make It Easy Chatbot 😉")]) // First User Button & Message/bubble created
        
    
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

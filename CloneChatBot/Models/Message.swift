//
//  Message.swift
//  CloneChatBot
//
//  Created by Ilona Sellenberkova on 22/02/2023.
//

import Foundation

enum Owner: String, Equatable {
    case bot
    case user
}

struct Reply: Hashable {
    var key: String
    var answer: String
}

//Define message structure
class Message: Hashable {
    
    static func == (lhs: Message, rhs: Message) -> Bool { // to confirm equitable
        lhs.contents == rhs.contents
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(contents)
    }
    
    var id: String
    var contents: [String]
    var owner: Owner
    var options: [Reply]
    
    // Defalt value is Bot as owner - assign if missing in initializing message
    // Message(content: "Hello", value: 1, options: ["Hi"])
    init(id: String, contents: [String], owner: Owner = .bot, options: [Reply] = []) {
        self.id = id
        self.contents = contents
        self.owner = owner
        self.options = options
    }
    
}


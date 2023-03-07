//
//  Bubble.swift
//  CloneChatBot
//
//  Created by Ilona Sellenberkova on 07/03/2023.
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

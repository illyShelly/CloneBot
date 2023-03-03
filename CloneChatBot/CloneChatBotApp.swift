//
//  CloneChatBotApp.swift
//  CloneChatBot
//
//  Created by Ilona Sellenberkova on 22/02/2023.
//

import SwiftUI

@main
struct CloneChatBotApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            let notes = try? 
            ChatbotView(chatbotVM: ChatbotViewModel.mock)
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

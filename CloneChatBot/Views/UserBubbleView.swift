//
//  UserBubbleView.swift
//  CloneChatBot
//
//  Created by Ilona Sellenberkova on 06/03/2023.
//

import SwiftUI

struct UserBubbleView: View {
    @ObservedObject var chatbotVM: ChatbotViewModel // pass VM into other screen
    
    @State var userChoice: String = ""
    @State var userOption: Reply
    
    var body: some View {
//        Moved button with methods from ChatbotView
        Button {
            // Post clicked content as message
            withAnimation(.linear(duration: 0.35)) {
                chatbotVM.postMessage(message: userOption.answer, sender: .user)
            }
            userChoice = userOption.key // "3"
        //  Assign a nextMessage into currentMessage
            chatbotVM.currentMessage = chatbotVM.getNextMessage(choice: userChoice)
        } label: {
            Text(userOption.answer)
        }
    }
}

struct UserBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        UserBubbleView(chatbotVM: ChatbotViewModel(database: [Message(id: "1", contents: ["Whatever here"])]), userOption: Reply(key: "2", answer: "French"))
            .bubbleStyle(customColor: .red, customFont: 18)
    }
}

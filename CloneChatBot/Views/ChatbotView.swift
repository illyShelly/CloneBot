//
//  ChatbotView.swift
//  CloneChatBot
//
//  Created by Ilona Sellenberkova on 22/02/2023.
//

import SwiftUI

struct ChatbotView: View {
    //    Initialize ChatbotVM
    @StateObject var chatbotVM: ChatbotViewModel = ChatbotViewModel()

//    @State var userChoice: String = "" // pass into next view
    
    let greeting: LocalizedStringKey = "greeting"

    var body: some View {
        VStack {
            //  Show welcome title
            HStack {
                Image(systemName: "text.bubble")
                    .foregroundColor(.pink)
                    .font(.title)
                    .fontWeight(.semibold)
                Text("greeting")
                    .font(.title)
                    .foregroundColor(.indigo)
                    .fontWeight(.bold)
            }

            //  Show scrolling text
            ScrollView {
                ForEach(chatbotVM.bubbles) { bubble in
                    if let sender = bubble.who {
                        switch sender {
                        case .bot:
                            HStack {
                                Text(bubble.info)
                                    .bubbleStyle(customColor: .systemTeal, customFont: 18)
                                    .padding(.horizontal, 15) // Padding around bubble
                                    .padding(.bottom, 20)
                                Spacer()
                            }
                        case .user:
                            HStack {
                                Spacer()
                                Text(bubble.info)
                                    .bubbleStyle(customColor: .systemIndigo, customFont: 18)
                                    .padding(.horizontal, 15)
                                    .padding(.bottom, 20)
                            }
                        default:
                             Text("Goodbye")
                        }
                    }
                }
                .rotationEffect(.degrees(180.0)) // flip upside down text
            }
            .rotationEffect(.degrees(180.0)) // start chat from button screen
            .background(.gray.opacity(0.09))


            //  User's answer - based on options of current message
            HStack {
                // Show all options as buttons in the currentMessage
                if let userOptions = chatbotVM.currentMessage.options {
                    ForEach(userOptions, id: \.self) { option in
                        
                        // More than 1 option show next to each other
                        switch userOptions.count {
                        case 1:
                            VStack {
                                UserBubbleView(chatbotVM: chatbotVM, userOption: option)
                                
                                    .bubbleStyle(customColor: .systemIndigo, customFont: 19)
                            }
                        default:
                            // More buttons
                            HStack {
                                UserBubbleView(chatbotVM: chatbotVM, userOption: option)
                                    .bubbleStyle(customColor: .systemPink, customFont: 18.5)
                            }
                        }
                    } // foreach
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 80)
//            .background(.gray.opacity(0.20))

        } // Main VS
    }
       
}

struct ChatbotView_Previews: PreviewProvider {
    static var previews: some View {
        ChatbotView(chatbotVM: .mock)
    }
}

//https://stackoverflow.com/questions/65765756/swiftui-scrolling-to-latest-message-for-chat-applictaion

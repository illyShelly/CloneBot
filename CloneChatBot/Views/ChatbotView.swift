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

    @State var userChoice: String = ""
    
    var body: some View {
        VStack {
            //  Show welcome title
            HStack {
                Image(systemName: "text.bubble")
                    .foregroundColor(.pink)
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Re-Turn")
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
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 10)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                
                                // Bubble style related
                                    .background(.teal.opacity(1.0))
                                    .cornerRadius(10.0) // under background
                                // Padding around bubble
                                    .padding(.horizontal, 15)
                                    .padding(.bottom, 20)
                                Spacer()
                            }
                        case .user:
                            HStack {
                                Spacer()
                                Text(bubble.info)
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 10)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                
                                    .background(.indigo.opacity(1.0))
                                    .cornerRadius(10.0)
                                // padding around bubble
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
//            .background(Color.init(uiColor: .systemGray6))
            .background(.gray.opacity(0.07))


            //  User's answer - based on options of current message
            HStack {
                // Show all options as buttons in the currentMessage
                if let userOptions = chatbotVM.currentMessage.options {
                    ForEach(userOptions, id: \.self) { option in
                        
                        // More than 1 option show next to each other
                        switch userOptions.count {
                        case 1:
                            VStack {
                                Button {
                                    // Post clicked content as message
                                    withAnimation(.linear(duration: 0.35)) {
                                        chatbotVM.postMessage(message: option.answer, sender: .user)
                                    }
                                   
                                    userChoice = option.key
                                //  Assign a nextMessage into currentMessage
                                    chatbotVM.currentMessage = chatbotVM.getNextMessage(choice: userChoice)
                                    userChoice = ""
                                } label: {
                                    Text(option.answer)
                                }
                                .padding(.horizontal, 15)
                                .padding(.vertical, 10)
                                .foregroundColor(.white)
                                .font(.system(size: 19))
                                
                                .background(.indigo)
                                .cornerRadius(10)

                            }
                        default:
                            // More buttons
                            HStack {
                                Button {
                                    // Post clicked content as message
                                    withAnimation(.default) {
                                        chatbotVM.postMessage(message: option.answer, sender: .user)
                                    }
                                    userChoice = option.key
                                //  Assign a nextMessage into currentMessage
                                    chatbotVM.currentMessage = chatbotVM.getNextMessage(choice: userChoice)
                                    userChoice = ""
                                } label: {
                                    Text(option.answer)
                                }
                                .padding(.horizontal, 15)
                                .padding(.vertical, 10)
                                .foregroundColor(.white)
                                .font(.system(size: 19))

                                .background(.pink)
                                .cornerRadius(5)
                                // smaller font for more btns
                                .padding(.trailing, 5) // space between btns
                            }
                        }
                    } // foreach
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 80)
//            .background(Color.init(uiColor: .systemGray6))
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

//
//  ChatbotView.swift
//  CloneChatBot
//
//  Created by Ilona Sellenberkova on 22/02/2023.
//

import SwiftUI

class ChatbotViewModel: ObservableObject {
    @Published var database: [Message] // declare var
    
    // The same as: var database: [Message] = []
    init(database: [Message] = []) { // init as empty arr
        self.database = database
    }
}


struct ChatbotView: View {
    //    Initialize ChatbotVM
    @StateObject var chatbotVM: ChatbotViewModel = ChatbotViewModel()
    
    @State var currentMessage: Message = Message(id: "0", contents: ["Welcome To Our Chatbot"], owner: .bot, options: [.init(key: "1", answer: "Hello!")])
    
//    @State var bubbles: [Bubble] = [Bubble(info: "Welcome To Our Chatbot")]
    @State var bubbles: [Bubble] = []

    @State var userChoice: String = ""
    
    var body: some View {
        VStack {
            //  Show welcome title
            HStack {
                Image(systemName: "text.bubble")
                    .foregroundColor(.pink)
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Welcome")
                    .font(.title)
                    .foregroundColor(.indigo)
                    .fontWeight(.bold)
            }

            //  Show scrolling text
            ScrollView {
//                Text(currentMessage.contents.first ?? "Welcome")
                //Text(currentMessage.owner.rawValue) // as default is 'bot'
                ForEach(bubbles) { bubble in
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
                if let userOptions = currentMessage.options {
                    ForEach(userOptions, id: \.self) { option in
                        
                        // More than 1 option show next to each other
                        switch userOptions.count {
                        case 1:
                            VStack {
                                Button {
                                    // Post clicked content as message
                                    postMessage(message: option.answer, sender: .user)
                                    userChoice = option.key
                                //  Assign a nextMessage into currentMessage
                                    currentMessage = getNextMessage(choice: userChoice)
                                } label: {
                                    Text(option.answer)
                                }
                                .padding(.horizontal, 15)
                                .padding(.vertical, 10)
                                .background(.indigo)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .font(.system(size: 19))

                            }
                        default:
                            // More buttons
                            HStack {
                                Button {
                                    // Post clicked content as message
                                    postMessage(message: option.answer, sender: .user)
                                    userChoice = option.key
                                //  Assign a nextMessage into currentMessage
                                    currentMessage = getNextMessage(choice: userChoice)
                                } label: {
                                    Text(option.answer)
                                }
                                .padding(.horizontal, 15)
                                .padding(.vertical, 10)
                                .background(.pink)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .font(.system(size: 19))
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
        func getNextMessage(choice: String) -> Message {
            var nextMessage: Message = .init(id: "", contents: [""])
            
            // database.first(where: { $0.id == message.id })
            for message in chatbotVM.database {
                if message.id == choice {
                    nextMessage = message
                }
            }
            return nextMessage
        }
        
        //    Post message as .bot or as .user
        func postMessage(message: String, sender: Sender) {
            withAnimation {
                bubbles.append(Bubble(info: message, who: sender))
                userChoice = ""
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation {
                    // Create bubble/s related to current message content
                    for note in currentMessage.contents {
                        bubbles.append(Bubble(info: note, who: .bot))
                    }
                    // bubbles.append(Bubble(info: currentMessage.contents.first! ?? "test"))
                }
            }
        }
}
    
enum Sender {
    case bot
    case user
}
    
struct Bubble: Identifiable {
    var id: String = "\(UUID())"
    var info: String
    var who: Sender = .bot
}

struct ChatbotView_Previews: PreviewProvider {
    static var previews: some View {
        ChatbotView(chatbotVM: .mock)
    }
}

//https://stackoverflow.com/questions/65765756/swiftui-scrolling-to-latest-message-for-chat-applictaion

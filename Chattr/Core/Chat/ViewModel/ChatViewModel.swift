//
//  ChatViewModel.swift
//  Chattr
//
//  Created by Omveer Panwar on 27/06/25.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messageText = ""
    @Published var messages = [Message]()
    
    let service: ChatService
    
    init (user: User) {
        self.service = ChatService(chatPartner: user)
        observeMessages()
    }
    
    func observeMessages() {
        service.observeMessages() { messages in
            self.messages.append(contentsOf: messages)
        }
    }
    func sendMessage() {
        service.sendMessage(messageText)
        
    }
}

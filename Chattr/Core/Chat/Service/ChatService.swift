//
//  ChatService.swift
//  Chattr
//
//  Created by Omveer Panwar on 27/06/25.
//

import Foundation
import Firebase
import FirebaseAuth

struct ChatService {
    static let messagesCollection = Firestore.firestore().collection("message")
    
    let chatPartner: User
     func sendMessage(_ messageText: String) {
         guard let currentUid = Auth.auth().currentUser?.uid else { return }
         let chatPartnerId = chatPartner.id
         
         let currentUserRef = FirebaseConstants.MessagesCollection.document(currentUid).collection(chatPartnerId).document()
         let chatPartnerRef = FirebaseConstants.MessagesCollection.document(chatPartnerId).collection(currentUid)
         
         let recentCurrentUserRef = FirebaseConstants.MessagesCollection.document(currentUid).collection("recent-messages").document(chatPartnerId)
         let recentPartnerRef = FirebaseConstants.MessagesCollection.document(chatPartnerId).collection("recent-messages").document(currentUid)
         let messageId = currentUserRef.documentID
         
         let message = Message(
             messageId: messageId, fromId: currentUid, toId: chatPartnerId, messageText: messageText, timestamp: Timestamp()
         )
         guard let MessageData = try? Firestore.Encoder().encode(message) else { return }
         currentUserRef.setData(MessageData)
         chatPartnerRef.document(messageId).setData(MessageData)
         
         recentCurrentUserRef.setData(MessageData)
         recentPartnerRef.setData(MessageData)
     }
     
    func observeMessages( completion: @escaping ([Message]) -> Void) {
         guard let currentUid = Auth.auth().currentUser?.uid else { return }
         let chatPartnerId = chatPartner.id
         
        let query = FirebaseConstants.MessagesCollection
             .document(currentUid)
             .collection(chatPartnerId)
             .order(by: "timestamp",descending: false)
         
         query.addSnapshotListener{ snapshot, _ in
             guard let changes = snapshot?.documentChanges.filter({$0.type == .added}) else { return }
             var messages = changes.compactMap({try? $0.document.data(as: Message.self)})
             
             for (index, message) in messages.enumerated() where message.isFromCurrentUser{
                 messages[index].user = chatPartner
             }
             completion(messages)
         }
     }
}

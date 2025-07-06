//
//  InboxService.swift
//  Chattr
//
//  Created by Omveer Panwar on 28/06/25.
//

import Foundation
import Firebase
import FirebaseAuth

class InboxService {
    @Published var documentChanges = [DocumentChange]()
    
    func observeRecentMessages() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let query = FirebaseConstants.MessagesCollection
            .document(uid)
            .collection("recent-messages")
            .order(by: "timestamp", descending: true)
            
        query.addSnapshotListener{snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({
                $0.type == .added || $0.type == .modified
            }) else { return }
            
            self.documentChanges = changes
        }
        }
    }


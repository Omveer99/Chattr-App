//
//  ChatBubble.swift
//  Chattr
//
//  Created by Omveer Panwar on 09/06/25.
//

import SwiftUI

struct ChatBubble: Shape {
    let isFromCurrentUser: Bool
   
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [
            .topLeft,
                .topRight,
            isFromCurrentUser ? .bottomLeft : .bottomRight
        ],
                                cornerRadii: CGSize(width: 16, height: 16))
    return Path(path.cgPath)
    }
}

#Preview {
    ChatBubble(isFromCurrentUser: true)
}

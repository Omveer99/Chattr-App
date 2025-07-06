//
//  IndexRowView.swift
//  Chattr
//
//  Created by Omveer Panwar on 08/06/25.
//

import SwiftUI

struct IndexRowView: View {
    let message: Message
    var body: some View {
        HStack(alignment: .top, spacing: 12){
            CircularImageProfileView(user: message.user, size: .medium)
            VStack(alignment: .leading, spacing: 4){
                Text(message.user?.fullname ?? "")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(message.messageText)
                    .font(.subheadline)
                    .foregroundColor(Color(.systemGray))
                    .lineLimit(2)
                    .frame(maxWidth:  UIScreen.main.bounds.width - 100, alignment: .leading )
            }
            HStack{
                Text(message.timestampString)
                
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .frame(height: 72)
    }
}

//#Preview {
//    IndexRowView()
//}

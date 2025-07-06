//
//  ChatView.swift
//  Chattr
//
//  Created by Omveer Panwar on 08/06/25.
//

import SwiftUI

struct ChatView: View {
   @StateObject var viewModel: ChatViewModel
    let user : User
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: ChatViewModel(user: user))
        self.user = user
    }
    var body: some View {
        VStack{
            ScrollView{
                VStack{
                    CircularImageProfileView(user: user, size: .xlarge)
                    VStack(spacing: 4){
                        Text(user.fullname)
                            .font(.title3)
                            .fontWeight(.semibold)
                        Text("Chattr-Messenger")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
                
                LazyVStack{
                    ForEach(viewModel.messages){ message in
                        ChatMessageCall(message: message)
                    }
                }
            }
            
            Spacer()
            
            ZStack(alignment: .trailing){
                TextField("Messag.....",text: $viewModel.messageText,axis: .vertical)
                    .padding(12)
                    .padding(.trailing,48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                Button {
                    viewModel.sendMessage()
                    viewModel.messageText = ""
                } label: {
                    Text("Send")
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .navigationTitle(user.fullname)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ChatView(user: User.MOCK_USER)
}

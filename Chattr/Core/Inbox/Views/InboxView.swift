//
//  InboxView.swift
//  Chattr
//
//  Created by Omveer Panwar on 08/06/25.
//

import SwiftUI

struct InboxView: View {
    @StateObject var viewModel = InboxViewModel()
    @State private var showNewMesaageView = false
    @State private var selectedUser: User?
    @State private var showChat = false
    
    private var user: User?{
        return viewModel.currentUser
    }
    var body: some View {
        NavigationStack{
            ScrollView{
                ActiveNowView()
                List{
                    ForEach(viewModel.recentMessages){message in
                        ZStack{
                            NavigationLink(value: message){
                                EmptyView()
                            }.opacity(0.0)
                            IndexRowView(message: message)
                        }
                        
                    }
                }
                .navigationTitle("Chats")
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(PlainListStyle())
                    .frame(height: UIScreen.main.bounds.height - 120)
                
            }
            .onChange(of: selectedUser, perform:  { newValue in
                showChat = newValue != nil
            })
            .navigationDestination(for: Message.self, destination: { message in
                if let user = message.user{
                    ChatView(user: user)
                }
            })
            .navigationDestination(for: Route.self, destination: { route in
                switch route {
                case .profile(let user):
                    ProfileView(user: user)
                case .chatView(let user) :
                    ChatView(user: user)
                }
                
            })
            .navigationDestination(isPresented: $showChat, destination:     {
                if let user = selectedUser {
                    ChatView(user: user)
                }
            })
            .fullScreenCover(isPresented: $showNewMesaageView, content: {
                NewMessageView(selectedUser: $selectedUser)
            })
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    if let user {
                        NavigationLink (value : Route.profile(user)){
                                CircularImageProfileView(user: user, size: .xSmall)
                                
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        showNewMesaageView.toggle()
                        selectedUser = nil
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32,height: 32)
                            .foregroundStyle(.black,Color(.systemGray5))
                    }

                }
            }
        }
    }
}

#Preview {
    InboxView()
}

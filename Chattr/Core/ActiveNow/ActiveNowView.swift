//
//  ActiveNowView.swift
//  Chattr
//
//  Created by Omveer Panwar on 08/06/25.
//

import SwiftUI

struct ActiveNowView: View {
    @StateObject var viewModel = ActiveNowViewModel()
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 32){
                ForEach(viewModel.users, id: \.self ){ user in
                    NavigationLink(value : Route.chatView(user)) {
                    VStack{
                        ZStack(alignment: .bottomTrailing){
                            CircularImageProfileView(user: user, size: .medium)
                            ZStack{
                                Circle()
                                    .fill(.white)
                                    .frame(width: 18, height: 18)
                                
                                Circle()
                                    .fill(Color(.systemGreen))
                                    .frame(width: 12,height: 12)
                            }
                        }
                        Text(user.firstName)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    }
                }
            }
            .padding()
        }
        .frame(height: 106)
    }
}

#Preview {
    ActiveNowView()
}

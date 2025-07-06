//
//  RegistrationView.swift
//  Chattr
//
//  Created by Omveer Panwar on 07/06/25.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = ResgistrationViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Spacer()
            Image("chattr")
                .resizable()
                .scaledToFit()
                .frame(width: 150,height: 150)
                .padding()
            
            VStack{
                TextField("Enter your email", text: $viewModel.email)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
                TextField("Enter your Full name", text: $viewModel.fullname)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
                SecureField("Enter your Password", text: $viewModel.password)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
            }
            Button {
                Task{try await viewModel.createUser()}
            } label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(.blue)
                    .cornerRadius(10)
            }.padding(.vertical)
            Spacer()
            Divider()
            
            Button {
              dismiss()
                   
            } label: {
                HStack(spacing:3){
                    Text("Already have an account?")
                        .foregroundColor(.blue)
                    Text("Sign in")
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
                .font(.footnote)
            }.padding(.vertical)
            
        }
    }
}

#Preview {
    RegistrationView()
}

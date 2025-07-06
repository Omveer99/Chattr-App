//
//  LoginView.swift
//  Chattr
//
//  Created by Omveer Panwar on 07/06/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationStack {
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
                    SecureField("Enter your Password", text: $viewModel.password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal,24)
                }
                
                Button {
                    print("Forgot Password")
                } label: {
                    Text("Forget Password?")
                        .foregroundColor(.blue)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing,28)
                }.frame(maxWidth: .infinity,alignment: .trailing)
                
                Button {
                    Task{try await viewModel.login()}
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(.blue)
                        .cornerRadius(10)
                }.padding(.vertical)
                
                
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40 ,height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40 ,height: 0.5)
                }
                .foregroundColor(.gray)
                
                HStack{
                    Image("Facebook_icon")
                        .resizable()
                        .frame(width: 20,height: 20)
                    Text("Continue with facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                    
                }.padding(.top,8)
                Spacer()
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing:3){
                        Text("Dont have an account?")
                            .foregroundColor(.blue)
                        Text("Sign up")
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                    .font(.footnote)
                }.padding(.vertical)
            }
        }

    
    }
}

#Preview {
    LoginView()
}

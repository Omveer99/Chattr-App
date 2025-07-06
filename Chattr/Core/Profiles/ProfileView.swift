//
//  ProfileView.swift
//  Chattr
//
//  Created by Omveer Panwar on 08/06/25.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    let user: User
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        VStack{
            VStack{
                PhotosPicker(selection: $viewModel.selectedItem){
                    if let profileImage = viewModel.profileImage{
                        profileImage
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    } else {
                        CircularImageProfileView(user: user, size: .xlarge)
                    }
                }
                Text(user.fullname)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                List{
                    Section{
                        ForEach(SettingsOptionsViewModel.allCases){ option in
                            HStack{
                                Image(systemName: option.imageName)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(option.imageBackgroundColor)
                                
                                Text(option.title)
                                    .font(.subheadline)
                            }
                        }
                    }
                    Section{
                        
                        
                        Button("Log Out"){
                            AuthService.shared.signOut()
                        }
                        Button("Delete Account"){
                            
                        }
                    }.foregroundColor(.red)
                }
            }
        }
    }
}

#Preview {
    ProfileView(user : User.MOCK_USER)
}

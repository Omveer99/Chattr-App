//
//  LoginViewModel.swift
//  Chattr
//
//  Created by Omveer Panwar on 15/06/25.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws{
        try await AuthService.shared.login(withEmail: email, Password: password)
    }
}

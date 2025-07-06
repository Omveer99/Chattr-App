//
//  ResgistrationViewModel.swift
//  Chattr
//
//  Created by Omveer Panwar on 15/06/25.
//

import SwiftUI

class ResgistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    
    func createUser() async throws{
        try await AuthService.shared.createUser(withEmail: email, Password: password, fullname: fullname)
    }
}

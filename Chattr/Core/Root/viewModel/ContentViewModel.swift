//
//  ContentViewModel.swift
//  Chattr
//
//  Created by Omveer Panwar on 15/06/25.
//

import Firebase
import FirebaseAuth
import Combine

class ContentViewModel : ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    init(){
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink{[weak self] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService
        }.store(in: &cancellables)
    }
}

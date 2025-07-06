//
//  MessageViewModel.swift
//  Chattr
//
//  Created by Omveer Panwar on 16/06/25.
//
import Foundation

class MessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init () {
        Task {
            try await fetchUsers()
        }
    }
    @MainActor
        func fetchUsers() async throws {
            self.users = try await UserService.fetchAllUsers()
        
    }
}


//
//  ContentView.swift
//  Chattr
//
//  Created by Omveer Panwar on 07/06/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                InboxView()
            } else{
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  File.swift
//  Chattr
//
//  Created by Omveer Panwar on 28/06/25.
//

import Foundation
import SwiftUI

struct SplashScreen: View {
    @State private var animate = false
    @State private var showMainView = false

    var body: some View {
        ZStack {
            if showMainView {
               
                ContentView()
            } else {
                Color.white
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Image("chattr")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .scaleEffect(animate ? 1.1 : 0.9)
                        .opacity(animate ? 1 : 0.5)
                        .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: animate)

                    Text("lets Chat Together")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(Color.green) 
                        .opacity(animate ? 1 : 0.5)
                        .animation(.easeIn(duration: 2), value: animate)
                }
                .onAppear {
                    animate = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            showMainView = true
                        }
                    }
                }
            }
        }
    }
}

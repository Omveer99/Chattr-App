//
//  CircularImageProfileView.swift
//  Chattr
//
//  Created by Omveer Panwar on 08/06/25.
//

import SwiftUI

enum ProfileImageSize{
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xlarge

    var dimentions: CGFloat {
        switch self {
            
        case .xxSmall:
            return 28
        case .xSmall:
            return 32
        case .small:
            return 40
        case .medium:
            return 56
        case .large:
            return 64
        case .xlarge:
            return 80
        }
    }
}

struct CircularImageProfileView: View {
    var user: User?
    let size : ProfileImageSize
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            Image(imageUrl)
                .resizable()
                .scaledToFit()
                .frame(width: size.dimentions, height: size.dimentions)
                .clipShape(Circle())
            
            
        } else {
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimentions, height: size.dimentions)
                .foregroundColor(Color(.systemGray4))
        }
    }
}

#Preview {
    CircularImageProfileView(user: User.MOCK_USER, size: .medium)
}

//
//  Route.swift
//  Chattr
//
//  Created by Omveer Panwar on 28/06/25.
//

import Foundation

enum Route: Hashable {
    case profile(User)
    case chatView(User)
}

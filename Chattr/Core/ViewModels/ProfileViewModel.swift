//
//  ProfileViewModel.swift
//  Chattr
//
//  Created by Omveer Panwar on 08/06/25.
//

import SwiftUI
import PhotosUI

class ProfileViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem? {
        didSet{Task{ try await loadImage()}}
    }
    
    
    @Published var profileImage : Image?
    func loadImage() async throws {
        guard let item = selectedItem else { return }
        guard let imageData = try await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: imageData) else { return }
        self.profileImage = Image(uiImage: uiImage)
        
    }
}

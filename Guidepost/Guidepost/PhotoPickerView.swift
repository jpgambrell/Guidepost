//
//  PhotoPickerView.swift
//  Guidepost
//
//  Created by John Gambrell on 1/25/24.
//
import PhotosUI
import SwiftUI

struct PhotoPickerView: View {
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            Spacer()
            PhotosPicker("Select Image My Guy", selection: $avatarItem, matching: .images)
            avatarImage?
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            Spacer()
            Button("Done"){
                dismiss()
            }
        }
        .onChange(of: avatarItem){
            Task{
                if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
                    avatarImage = loaded
                } else {
                    print("Image failed to load")
                }
            }
        }
    }
}

#Preview {
    PhotoPickerView()
}

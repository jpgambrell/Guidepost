//
//  AddGuidepostView.swift
//  Guidepost
//
//  Created by John Gambrell on 1/23/24.
//

import SwiftUI
import PhotosUI

struct AddGuidepostView: View {
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    @State private var showPickedImage = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack{
            avatarImage?
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            Spacer()
//            PhotosPicker("Select Image My Guy", selection: $avatarItem, matching: .images)
            PhotosPicker(selection: $avatarItem,
                                matching: .images) {
               Image(systemName: "star")
                    .resizable()
                    .frame(width: 100, height: 100)
                    
                       //Text("Select Photos")
                   }
            
        
         
            Spacer()
    
            Button("Done") {
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
//        .sheet(isPresented: $showPhotoPickerView){
//            PhotoPickerView()
//                .presentationDetents([.large])
//                .presentationDragIndicator(.automatic)
//        }
       
        
    }
}


#Preview {
    AddGuidepostView()
}

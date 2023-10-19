//
//  Homelanding.swift
//  Guidepost
//
//  Created by John Gambrell on 10/19/23.
//

import SwiftUI

struct Homelanding: View {
    @State var showDetailSheet = false
    var body: some View {
        Button("Click Me") {
            showDetailSheet = true
        }
        .sheet(isPresented: $showDetailSheet){
            Text("Hello")
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.automatic)
        }
    }
        
}

struct Homelanding_Previews: PreviewProvider {
    static var previews: some View {
        Homelanding()
    }
}

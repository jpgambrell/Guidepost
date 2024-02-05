import SwiftUI

struct HomelandingView: View {
    @State var showDetailSheet = false
    @State var showAddGuidepostSheet = false
    var guidepostModel: [GuidepostModel] {
        print("loading...")
        return Bundle.main.decode([GuidepostModel].self, from: "GPData.json")
   }
    var body: some View {
        NavigationStack{
            
        ScrollView {
                    LazyVGrid(

                        columns: Array(
                            repeating: .init(.adaptive(minimum: 75), spacing: 1),
                            count: 3
                        ),
                        spacing: 1
                    ) {

                        ForEach(guidepostModel, id: \.self) { guidepost in
                            ZStack{
                               
                                Image(guidepost.imgURL ?? "")
                                    .resizable()
                                    .scaledToFit()
                                    .onTapGesture {
                                        showDetailSheet = true
                                    }
                            }
                            
                        }
                    }
                }
        .toolbar {
                Button{
                    showAddGuidepostSheet = true
                }
        label: {
            Image(systemName: "plus")
        }
         
        }
        .sheet(isPresented: $showAddGuidepostSheet){
            PhotoPickerView()
                .presentationDetents([.large])
                .presentationDragIndicator(.automatic)
        }
        .sheet(isPresented: $showDetailSheet){
           GuidepostDetailView()
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.automatic)
        }
        }
    }
        
}

#Preview {
    HomelandingView()
}



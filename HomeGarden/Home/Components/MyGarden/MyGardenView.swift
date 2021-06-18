//
//  Created by Maciej Gorecki on 13/06/2021
//

import SwiftUI

struct MyGardenView: View {
    let namespace: Namespace.ID
    
    @StateObject var store = MyGardenStore()
    @Binding var selectedPlant: Plant?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [.init(.adaptive(minimum: 300))], spacing: 16) {
                ForEach(store.plants) { plant in
                    if selectedPlant == plant {
                        Color.clear
                    } else {
                        MyPlantView(
                            plant: plant,
                            namespace: namespace
                        )
                            .padding(.leading, store.isPlantFirst(plant) ? 24 : 0)
                            .padding(.trailing, store.isPlantLast(plant) ? 24 : 0)
                            .onTapGesture {
                                withAnimation {
                                    selectedPlant = plant
                                }
                            }
                    }

                }
            }
        }
        .frame(height: 250)
    }
}

struct MyGardenList_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        MyGardenView(
            namespace: namespace,
            selectedPlant: .constant(nil)
        )
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

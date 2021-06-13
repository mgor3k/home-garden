//
//  Created by Maciej Gorecki on 13/06/2021
//

import SwiftUI

struct MyGardenView: View {
    @StateObject var store = MyGardenStore()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [.init(.adaptive(minimum: 300))], spacing: 16) {
                ForEach(store.plants) { plant in
                    MyPlantView(plant: plant)
                        .padding(.leading, store.isPlantFirst(plant) ? 24 : 0)
                        .padding(.trailing, store.isPlantLast(plant) ? 24 : 0)
                }
            }
        }
        .frame(height: 250)
    }
}

struct MyGardenList_Previews: PreviewProvider {
    static var previews: some View {
        MyGardenView()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

//
//  Created by Maciej Gorecki on 13/06/2021
//

import SwiftUI

struct MyGardenList: View {
    @StateObject var store = MyGardenStore()
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("My Garden")
                    .bold()
                    .font(.title3)
                
                Spacer()
                
                Text("See all")
                    .font(.callout)
            }
            .padding(.horizontal, 24)
            
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
            
            Spacer()
        }
    }
}

struct MyGardenList_Previews: PreviewProvider {
    static var previews: some View {
        MyGardenList()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

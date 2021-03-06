//
//  Created by Maciej Gorecki on 19/06/2021
//

import SwiftUI

struct PlantDetailsBottomSheet: View {
    let plant: Plant
    @StateObject var store = PlantDetailsBottomSheetStore()
    
    var body: some View {
        VStack {
            PlantDetailsMenu(
                items: store.items,
                selectedItem: $store.currentItem
            )
                .padding(24)
            
            VStack {
                switch store.currentItem {
                case .more:
                    PlantDetailsMoreView(
                        description: plant.description
                    )
                case .tips:
                    PlantDetailsTipView()
                case .activity:
                    PlantDetailsActivityView()
                case .calendar:
                    PlantDetailsCalendarView()
                }
            }
            .padding(.horizontal, 24)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white.ignoresSafeArea())
    }
}

struct PlantDetailsBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailsBottomSheet(
            plant: MockMyGardenProvider.plants[0]
        )
    }
}

//
//  Created by Maciej Gorecki on 19/06/2021
//

import SwiftUI

struct PlantDetailsBottomSheet: View {
    @StateObject var store = PlantDetailsBottomSheetStore()
    
    var body: some View {
        VStack {
            PlantDetailsMenu(
                items: store.items,
                selectedItem: $store.currentItem
            )
                .padding(24)
            
            switch store.currentItem {
            case .more:
                PlantDetailsMoreView()
            case .tips:
                PlantDetailsTipView()
            case .activity:
                PlantDetailsActivityView()
            case .calendar:
                PlantDetailsCalendarView()
            }
            
            Spacer()
            Button("Some button", action: {})
                .buttonStyle(.bordered)
                .tint(.accentColor)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white.ignoresSafeArea())
    }
}

struct PlantDetailsBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailsBottomSheet()
    }
}

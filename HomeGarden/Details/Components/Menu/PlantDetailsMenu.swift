//
//  Created by Maciej Gorecki on 19/06/2021
//

import SwiftUI

struct PlantDetailsMenu: View {
    @Namespace var namespace
    
    let items: [PlantDetailsMenuItem]
    @Binding var selectedItem: PlantDetailsMenuItem
    
    var body: some View {
        HStack(spacing: 32) {
            ForEach(items) { item in
                Text(item.title)
                    .bold()
                    .rotationEffect(
                        item == selectedItem ? .degrees(-4) : .zero
                    )
                    .animation(.default, value: selectedItem)
                    .background(
                        item == selectedItem ? Rectangle()
                            .foregroundColor(.orange)
                            .frame(height: 2)
                            .cornerRadius(1)
                            .offset(y: 16)
                            .matchedGeometryEffect(
                                id: "geo",
                                in: namespace
                            ) : nil
                    )
                    .animation(
                        .spring().speed(4),
                        value: selectedItem
                    )
                    .onTapGesture {
                        selectedItem = item
                    }
            }
            Spacer()
        }
    }
}

struct PlantDetailsMenu_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailsMenu(
            items: PlantDetailsMenuItem.allCases,
            selectedItem: .constant(.more)
        )
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

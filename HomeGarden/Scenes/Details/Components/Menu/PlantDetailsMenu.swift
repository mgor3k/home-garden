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
                Button(action: { selectedItem = item }) {
                    Text(item.title)
                        .foregroundColor(.black)
                        .bold()
                        .scaledToFill()
                }
                .rotationEffect(
                    item == selectedItem ? .degrees(-2) : .zero
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
                    Animation.spring(response: 1, dampingFraction: 0.7, blendDuration: 1).speed(4),
                    value: selectedItem
                )
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
            .previewLayout(.fixed(width: 300, height: 100))
    }
}

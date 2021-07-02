//
//  Created by Maciej Gorecki on 13/06/2021
//

import SwiftUI

struct MyPlantView: View {
    let plant: Plant
    let namespace: Namespace.ID
    
    var body: some View {
        VStack {
            CachedAsyncImage(url: plant.imageURL) {
                $0.resizable()
            } placeholder: {
                Color.gray
            }
                .scaledToFill()
                .frame(height: 200)
                .overlay(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                           .stroke(.gray, lineWidth: 1)
                   )
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                .matchedGeometryEffect(
                    id: plant,
                    in: namespace
                )
            
            HStack {
                Text(plant.name)
                    .font(.caption)
                    .fontWeight(.medium)
                    .padding(.leading, 2)

                Spacer()
            }
        }
        .frame(width: 150)
        .zIndex(2)
    }
}

struct MyGardenView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        MyPlantView(
            plant: MockMyGardenProvider.plants[4],
            namespace: namespace
        )
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

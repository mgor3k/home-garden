//
//  Created by Maciej Gorecki on 18/06/2021
//

import SwiftUI

struct PlantDetails: View {
    let namespace: Namespace.ID
    let plant: Plant
    
    let onDismiss: (() -> Void)
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                ScrollView {
                    content
                }
                Spacer()
                
                PlantDetailsBottomSheet(plant: plant)
                    .defaultShadow()
                    .frame(
                        width: proxy.size.width,
                        height: proxy.size.height / 3
                    )
            }
        }
        
    }
    
    var content: some View {
        VStack(spacing: 0) {
            PlantDetailsNavigationBar(
                onDismiss: onDismiss
            )
            
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(plant.name)
                            .font(.largeTitle)
                            .bold()
                        
                        Text("some description")
                            .font(.caption)
                            .fontWeight(.light)
                    }
                    
                    ForEach(plant.features ?? []) {
                        PlantFeatureView(feature: $0)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                CachedAsyncImage(url: plant.imageURL) {
                    $0.resizable()
                } placeholder: {
                    Color.gray
                }
                    .scaledToFit()
                    .matchedGeometryEffect(
                        id: plant,
                        in: namespace
                    )
                    .frame(width: 200, height: 300)
            }
            Spacer()
        }
    }
}

struct PlantDetails_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        PlantDetails(
            namespace: namespace,
            plant: MockMyGardenProvider.plants[0],
            onDismiss: {}
        )
    }
}

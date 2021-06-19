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
                
                PlantDetailsBottomSheet()
                    .defaultShadow()
                    .ignoresSafeArea()
                    .frame(
                        width: proxy.size.width,
                        height: proxy.size.height / 4
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
                    VStack(spacing: 12) {
                        Text(plant.name)
                            .font(.largeTitle)
                            .bold()
                        
                        Text("some description")
                            .font(.caption)
                            .fontWeight(.light)
                    }
                    
                    ForEach(plant.features) {
                        PlantFeatureView(feature: $0)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                Image(plant.imageName)
                    .resizable()
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
            plant: MyGardenStore().plants[0],
            onDismiss: {}
        )
    }
}

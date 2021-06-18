//
//  Created by Maciej Gorecki on 18/06/2021
//

import SwiftUI

struct PlantDetails: View {
    let namespace: Namespace.ID
    let plant: Plant
    
    let onDismiss: (() -> Void)
        
    var body: some View {
        VStack {
            HStack {
                Button(action: onDismiss) {
                    Image(systemName: "arrow.left")
                        .font(.title3)
                        .padding()
                }
                Spacer()
            }
            HStack(alignment: .top) {
                VStack {
                    Text(plant.name)
                        .font(.largeTitle)
                        .padding()
                        .matchedGeometryEffect(id: "\(plant)text", in: namespace)
                    Spacer()
                }
                Spacer()
                Image(plant.imageName)
                    .resizable()
                    .scaledToFit()
                    .matchedGeometryEffect(id: plant, in: namespace)
                    .frame(width: 200, height: 300)
            }
            Spacer()
        }
    }
}

struct PlantDetails_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        PlantDetails(namespace: namespace, plant: .init(name: "hehe", imageName: "1"), onDismiss: {})
    }
}

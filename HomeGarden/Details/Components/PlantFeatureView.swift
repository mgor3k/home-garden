//
//  Created by Maciej Gorecki on 18/06/2021
//

import SwiftUI

// TODO: Refactor border
struct PlantFeatureView: View {
    let feature: PlantFeature
    
    var body: some View {
        HStack {
            Image(systemName: feature.systemImageName)
            
            VStack(alignment: .leading) {
                Text(feature.title)
                    .foregroundColor(.gray)
                Text(feature.value)
                    .bold()
            }
            .font(.callout)
            Spacer()
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                   .stroke(.gray, lineWidth: 1)
           )
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }
}

struct PlantFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        PlantFeatureView(feature: .init(title: "haha", value: "loool", systemImageName: "drop"))
            .frame(width: 200)
    }
}

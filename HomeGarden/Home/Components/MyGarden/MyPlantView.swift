//
//  Created by Maciej Gorecki on 13/06/2021
//

import SwiftUI

struct MyPlantView: View {
    let plant: Plant
    
    var body: some View {
        VStack {
            Image(plant.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .overlay(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                           .stroke(.gray, lineWidth: 1)
                   )
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            
            HStack {
                Text(plant.name)
                    .font(.caption)
                    .fontWeight(.medium)
                    .padding(.leading, 2)
                Spacer()
            }
        }
        .frame(width: 150)
    }
}

struct MyGardenView_Previews: PreviewProvider {
    static var previews: some View {
        MyPlantView(plant: MyGardenStore().plants[4])
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

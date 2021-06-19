//
//  Created by Maciej Gorecki on 19/06/2021
//

import SwiftUI

struct PlantDetailsMoreView: View {
    let description: String
    
    var body: some View {
        Text(description)
            .multilineTextAlignment(.leading)
    }
}

struct PlantDetailsMoreView_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailsMoreView(description: "test")
    }
}

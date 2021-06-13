//
//  Created by Maciej Gorecki on 13/06/2021
//

import SwiftUI

struct SectionText: View {
    let title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .bold()
            .font(.title3)
    }
}

struct SectionText_Previews: PreviewProvider {
    static var previews: some View {
        SectionText("Title")
    }
}

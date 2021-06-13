//
//  Created by Maciej Gorecki on 13/06/2021
//

import SwiftUI

struct PageIndicator: View {
    let currentPage: Int
    let pagesCount: Int
    
    var size: CGFloat = 10
    
    var body: some View {
        HStack {
            ForEach(0..<pagesCount, id: \.self) { page in
                Circle()
                    .frame(width: size, height: size)
                    .foregroundColor(page == currentPage ? .black : .gray.opacity(0.5))
            }
        }
    }
}

struct PageIndicator_Previews: PreviewProvider {
    static var previews: some View {
        PageIndicator(currentPage: 0, pagesCount: 3)
            .previewLayout(.fixed(width: 200, height: 100))
    }
}

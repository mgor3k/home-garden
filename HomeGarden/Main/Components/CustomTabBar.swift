//
//  Created by Maciej Gorecki on 15/06/2021
//

import SwiftUI

struct CustomTabBar: View {
    let pages: [Page]
    @Binding var currentPage: Page
    
    var body: some View {
        ZStack {
            Color.white
                .shadow(color: .gray.opacity(0.3), radius: 20, x: 0, y: 0)
                .ignoresSafeArea(edges: .bottom)
            
            HStack(alignment: .center) {
                ForEach(pages, id: \.self) { page in
                    Image(systemName: "house.fill")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            currentPage = page
                        }
                }
            }
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(pages: [], currentPage: .constant(.home))
    }
}

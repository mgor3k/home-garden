//
//  Created by Maciej Gorecki on 15/06/2021
//

import SwiftUI

struct CustomTabBar: View {
    let actionPage: Page
    let pages: [Page]
    
    @Binding var currentPage: Page
    
    var body: some View {
        ZStack {
            TabBarShape()
                .foregroundColor(.white)
                .shadow(color: .gray.opacity(0.3), radius: 20, x: 0, y: 0)
                .ignoresSafeArea(edges: .bottom)
            
//            HStack(alignment: .center) {
//                ForEach(pages, id: \.self) { page in
//                    Image(systemName: "house.fill")
//                        .font(.title3)
//                        .frame(maxWidth: .infinity)
//                        .onTapGesture {
//                            currentPage = page
//                        }
//                }
//            }
            
            Circle()
                .foregroundColor(.black)
                .frame(width: 55, height: 55)
                .offset(y: -30)
            
            HStack {
                HStack {
                    Image(systemName: "house.fill")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                    
                    Image(systemName: "house.fill")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                }
                
                Spacer()
                    .frame(width: 70)
                
                HStack {
                    Image(systemName: "house.fill")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                    
                    Image(systemName: "house.fill")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue
            
            CustomTabBar(actionPage: .home, pages: [.bookmarks, .notifications, .bookmarks, .notifications], currentPage: .constant(.home))
                .frame(height: 100)
        }
            .previewLayout(.fixed(width: 300, height: 250))
    }
}

//
//  Created by Maciej Gorecki on 15/06/2021
//

import SwiftUI

struct MainView: View {
    @StateObject var router = MainRouter()
    
    var body: some View {
        NavigationView {
            content
        }
    }
    
    var content: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                switch router.currentPage {
                case .home:
                    HomeView()
                        .navigationBarHidden(true)
                case .search:
                    Color.red
                        .navigationBarHidden(true)
                }
                
                // TODO: Check non-notch devices
                CustomTabBar(
                    pages: router.possiblePages,
                    currentPage: $router.currentPage
                )
                    .frame(
                        width: proxy.size.width,
                        height: proxy.size.height / 12
                    )
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

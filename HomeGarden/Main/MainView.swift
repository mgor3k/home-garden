//
//  Created by Maciej Gorecki on 15/06/2021
//

import SwiftUI

struct MainView: View {
    @Namespace var namespace
    @StateObject var router = MainRouter()
    
    var body: some View {
        NavigationView {
            ZStack {
                content
                    .navigationBarHidden(true)
                
                if let plant = router.selectedPlant {
                    PlantDetails(
                        namespace: namespace,
                        plant: plant,
                        onDismiss: router.dismissDetails
                    )
                        .background(Color.white.ignoresSafeArea())
                        .zIndex(3)
                }
            }
        }
    }
    
    var content: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                switch router.currentPage {
                case .home:
                    HomeView(
                        namespace: namespace,
                        selectedPlant: $router.selectedPlant
                    )
                case .search:
                    Color.red
                case .bookmarks:
                    Color.blue
                case .notifications:
                    Color.pink
                case .camera:
                    Text("Camera should be here")
                }
                
                Spacer()
                
                // TODO: Check non-notch devices
                CustomTabBar(
                    viewModel: router.tabBarModel,
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

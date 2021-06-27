//
//  Created by Maciej Gorecki on 15/06/2021
//

import SwiftUI

struct CustomTabBar: View {
    let viewModel: ViewModel
    
    @Binding var currentPage: Page
    
    var body: some View {
        ZStack {
            TabBarShape()
                .foregroundColor(.white)
                .defaultShadow()
                .ignoresSafeArea(edges: .bottom)
            
            GeometryReader { proxy in
                Circle()
                    .foregroundColor(.accentColor)
                    .overlay(
                        Image(systemName: viewModel.actionPage.imageName)
                            .foregroundColor(.white)
                            .font(.title3)
                    )
                    .frame(width: 55, height: 55)
                    .frame(maxWidth: .infinity)
                    .offset(y: -(proxy.size.height / 2) + 10)
                    .shadow(radius: 20)
                    .onTapGesture {
                        currentPage = viewModel.actionPage
                    }
            }
            
            HStack {
                HStack {
                    TabItem(
                        page: viewModel.page1,
                        currentPage: $currentPage
                    )
                    TabItem(
                        page: viewModel.page2,
                        currentPage: $currentPage
                    )
                }
                
                Spacer()
                    .frame(width: 70)
                
                HStack {
                    TabItem(
                        page: viewModel.page3,
                        currentPage: $currentPage
                    )
                    TabItem(
                        page: viewModel.page4,
                        currentPage: $currentPage,
                        badge: .init(count: 2, color: .orange)
                    )
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

extension CustomTabBar {
    struct ViewModel {
        let actionPage: Page
        let page1: Page
        let page2: Page
        let page3: Page
        let page4: Page
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue
            
            CustomTabBar(
                viewModel: MainRouter().tabBarModel,
                currentPage: .constant(.home)
            )
                .frame(height: 100)
        }
            .previewLayout(.fixed(width: 300, height: 250))
    }
}

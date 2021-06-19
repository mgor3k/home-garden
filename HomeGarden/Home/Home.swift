//
//  Created by Maciej Gorecki on 13/06/2021.
//

import SwiftUI

struct HomeView: View {
    let namespace: Namespace.ID
    
    @StateObject var store = FactsStore()
    
    @Binding var selectedPlant: Plant?
    @State var isShowingProfile = false
    
    let onLogoutTapped: () -> Void
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            content
        }
        .sheet(isPresented: $isShowingProfile) {
            ProfileView {
                isShowingProfile = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: onLogoutTapped)
            }
        }
    }
    
    var content: some View {
        VStack(spacing: 32) {
            HomeTopBar(
                tasksCount: 2,
                onSearchTapped: {
                    print("search tapped")
                },
                onProfileTapped: {
                    isShowingProfile = true
                }
            )
            .padding(.horizontal, 24)
            
            VStack(alignment: .leading, spacing: 24) {
                SectionText("Did you know...")
                FactsView(store: store)
            }
            .padding(.horizontal, 24)
            
            VStack {
                HStack {
                    SectionText("My Garden")
                    Spacer()
                    NavigationLink(destination: MyGardenListView()) {
                        Text("See all")
                            .font(.callout)
                    }
                }
                .padding(.top, 16)
                .padding(.horizontal, 24)
                
                MyGardenView(
                    namespace: namespace,
                    selectedPlant: $selectedPlant
                )
            }
            
            CalendarSection()
            
            Spacer()
        }
        .padding(.vertical, 24)
    }
}

struct HomeView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        HomeView(
            namespace: namespace,
            selectedPlant: .constant(nil),
            onLogoutTapped: {}
        )
    }
}
